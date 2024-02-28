# Exercício Union - Laboratório de Banco de Dados FATEC ZL

Este repositório contém uma solução para o exercício proposto pelo Prof. M.Sc. Leandro Colevati dos Santos no Laboratório de Banco de Dados da FATEC ZL.

## Descrição do Problema
O exercício aborda o cenário de gerenciamento de palestras em uma faculdade, onde palestrantes apresentam palestras para alunos e não alunos. Para alunos, os dados já estão referenciados em outro sistema pelo RA (Registro Acadêmico), enquanto para não alunos, é necessário ter informações adicionais como RG e Órgão Expedidor para fornecer certificados.

O desafio surge na geração da lista de presença, que deve ser obtida através de uma consulta que retorna informações como número do documento, nome da pessoa, título da palestra, nome do palestrante, carga horária e data. A lista deve ser única por palestra, incluindo tanto alunos quanto não alunos, com o número do documento sendo uma referência ao RA para alunos e RG + Órgão Expedidor para não alunos, e deve ser ordenada pelo nome da pessoa.

## Solução Proposta
Uma solução adequada envolve a criação de uma view de seleção que produza a saída conforme especificado no exercício. Esta view deve unir as informações dos alunos e não alunos, garantindo a ordenação correta e a inclusão de todos os dados necessários.

## Modelo de Entidade e Relacionamento (MER)
![MER] ![image](https://github.com/DaviQzR/EXERCICIO-UNION-LAB-DE-BD/assets/125469425/c374f36f-f4ee-4be0-a2de-55219377fb1c)


## Como Utilizar
1. Clone este repositório.
2. Execute o script SQL fornecido para criar a view de seleção.
3. Utilize a view gerada para obter a lista de presença conforme necessário.

## Contribuições
Contribuições são bem-vindas! Se você encontrou uma maneira de melhorar esta solução ou corrigir possíveis problemas, sinta-se à vontade para abrir um problema ou enviar um pull request.


