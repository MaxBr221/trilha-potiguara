package br.com.tupidigital.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.scheduling.annotation.Async;
import org.springframework.web.client.RestTemplate;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpEntity;
import org.springframework.http.MediaType;
import java.util.Map;
import java.util.List;

@Service
public class EmailService {

    @Value("${spring.mail.username}")
    private String remetente;

    @Value("${brevo.api.key}")
    private String brevoApiKey;

    @Async
    public void enviarEmail(String destinatario, String assunto, String corpo) {
        try {
            RestTemplate restTemplate = new RestTemplate();
            
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            headers.set("api-key", brevoApiKey);

            Map<String, Object> body = Map.of(
                "sender", Map.of("name", "Tupi Digital", "email", remetente),
                "to", List.of(Map.of("email", destinatario)),
                "subject", assunto,
                "textContent", corpo
            );

            HttpEntity<Map<String, Object>> request = new HttpEntity<>(body, headers);
            
            restTemplate.postForObject("https://api.brevo.com/v3/smtp/email", request, String.class);
            System.out.println("Email enviado com sucesso via Brevo API para: " + destinatario);
        } catch (Exception e) {
            System.err.println("Erro ao enviar email para " + destinatario + " via Brevo API: " + e.getMessage());
            System.err.println("Corpo do email:\n" + corpo);
        }
    }
}
