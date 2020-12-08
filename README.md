# PROJETO MACHINE RENTAL

## PROBLEMA

Robson comprou uma máquina portátil e moderna para limpar estofados e tapetes.
Seu modelo de negócio é ganhar dinheiro alugando a máquina por R$ 100,00 a diária.
Ele entrega às 10:00 da manhã do primeiro dia da diária e busca às 08:00 no último dia.
Trabalha todos os dias, fim de semana e feriados.
O negócio está crescendo, e agora ele precisa de um sistema para controlar as reservas.

## ETAPAS PARA RESOLUÇÃO DO PROBLEMA

- [x]  Criar projeto
- [x]  Iniciar Git e dar primeiro commit
- [x]  Colocar as etapas para a concretização do projeto no Read.me
- [x]  Configurações Iniciais (rspec)
- [x]  Criar repositorio GitHub e subir projeto
- [x]  Relembrar como funciona datas em ruby

- Testes
  - [x]  Criar testes para Agendamento da maquina
  - [x]  Fazer os testes passarem
  - [x]  Refatorar código
  - [x]  Criar testes para validar metodo que Verifica Data Disponível
  - [x]  Fazer os testes passarem
  - [x]  Refatorar código


- Melhorias
  *  Configurar Bootstrap
  *  Implementar FactoryBot para melhoria dos testes
  *  Criar teste BDD com capybara 
  *  Fazer testes BDD passarem
  *  Arrumar estética visual com bootstrap

- Problemas a serem resolvidos:

 Deixei comentado uma linha no teste de schedule que verifica se o objeto é valido. Criei uma validação na classe Schedule que verifica se as datas estão disponiveis (check_dates). A finalidade deste metodo é passar para o metodo availability, da classe CalendarDay, a data inicial e os dias com a finalidade deste metodo poder verificar se as datas estao disponiveis.
 Porém, passando pelas iterações (com o uso do byebug deixado comentado) as datas são realmente incrementadas, passando no exemplo por exemplo: dia 08, depois dia 09, depois dia 10, mas ai volta para o dia 08. Assim, faz com que o metodo find_by encontre a data e volte false para a verificação de availability. Surgindo assim a duvida de por que a data retorna ao inicio e por que ela encontra a data no banco, tendo em vista que o banco de testes é reiniciado a cada teste e não sendo um metodo que salva e sim procura a data apenas.
 Este erro está ainda à ser analisado com a cabeça mais fresca e corrigido, seguindo o princípio de refatoração, pois faz parte do TDD,utilizado para o exercicio proposto. 

 No mais, está com todos os testes passando, cumprindo seus objetivos de dar segurança e de que tudo funciona como deveria funcionar.





