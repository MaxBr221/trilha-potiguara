package br.com.tupidigital.service;

import br.com.tupidigital.dto.ConteudoLinguisticoRequestDTO;
import br.com.tupidigital.repository.ConteudoLinguisticoRepository;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

@Slf4j
@Service
@RequiredArgsConstructor
public class ImportadorDicionarioService implements CommandLineRunner {

    private final ConteudoLinguisticoService conteudoLinguisticoService;
    private final ConteudoLinguisticoRepository repository;
    private final ObjectMapper objectMapper;

    @Value("file:../dicionario_tupi_basico.json")
    private Resource jsonResource;

    @Override
    public void run(String... args) throws Exception {
        log.info("Iniciando verificação de importação do dicionário...");
        
        try {
            if (!jsonResource.exists()) {
                log.warn("Arquivo de dicionário não encontrado no caminho especificado: {}", jsonResource.getURI());
                return;
            }

            long count = repository.count();
            if (count > 0) {
                log.info("Banco de dados já contém {} registros de conteúdo linguístico. Importação ignorada.", count);
                return;
            }

            try (InputStream is = jsonResource.getInputStream()) {
                List<Map<String, String>> palavras = objectMapper.readValue(is, new TypeReference<List<Map<String, String>>>() {});
                
                for (Map<String, String> p : palavras) {
                    ConteudoLinguisticoRequestDTO dto = ConteudoLinguisticoRequestDTO.builder()
                            .palavraTupi(p.get("palavra"))
                            .traducaoPtBr(p.get("traducao"))
                            .fonetica(p.getOrDefault("fonetica", ""))
                            .tipo(p.getOrDefault("categoria", "PALAVRA").toUpperCase())
                            .build();
                    
                    conteudoLinguisticoService.criar(dto);
                }
                log.info("Dicionário importado com sucesso! {} palavras adicionadas.", palavras.size());
            }

        } catch (Exception e) {
            log.error("Erro ao importar dicionário: ", e);
        }
    }
}
