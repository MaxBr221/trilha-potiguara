package br.com.tupidigital.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {

    @Autowired
    private JavaMailSender mailSender;

    @Value("${spring.mail.username}")
    private String remetente;

    public void enviarEmail(String destinatario, String assunto, String corpo) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(remetente);
        message.setTo(destinatario);
        message.setSubject(assunto);
        message.setText(corpo);
        
        try {
            mailSender.send(message);
            System.out.println("Email enviado para: " + destinatario);
        } catch (Exception e) {
            System.err.println("Erro ao enviar email para " + destinatario + ": " + e.getMessage());
            System.err.println("Corpo do email:\\n" + corpo);
        }
    }
}
