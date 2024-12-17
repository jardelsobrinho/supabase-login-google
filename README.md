### LOGIN SUPABASE COM GOOGLE
Para configurar o login usando a autenticação do google, é necessário configurar alguns procedimentos.

#### Configurações no Google Cloud

 1. Crie um novo projeto no google cloud
 2. Acesse o Menu de **API E SERVIÇOS > CREDENCIAIS**
 e clique em **+ CRIAR CREDENCIAIS**.
 3. Escolha **ID do Cliente OAuth**.
 4. Ele vai pedir para configurar o ID do Cliente. Clique em **CONFIGURAR TELA DE CONSENTIMENTO**.
 5. Escolha **ACESSAR NOVA EXPERIÊNCIA**, se aparecer essa opção. Talvez ela já esteja habilitada por padrão.
 6. Clique em **VAMOS COMEÇAR**.
 7. Informe um nome para o Aplicativo e um Email de Contato e clique em **PROXIMA**
 8. Marque EXTERNO e clique em **PRÓXIMA**
 9. Coloque o email novamente e clique em **PRÓXIMA**
 10. Marque EU CONCORDO  e clique em **CONTINUAR**  e depois em **CRIAR**. 
 11. Acesse novamente  o Menu de **API E SERVIÇOS > CREDENCIAIS** e clique em **+ CRIAR CREDENCIAIS** e escolha  ID do Cliente OAuth. Talvez ele peça novamente para CONFIGURAR A TELA DE CONSENTIMENTO. Se aparecer isso de novo pressione **Ctrl + F5** para forçar atualizar a pagina.
 12. Nessa tela, você vai criar os Clients Id usados para autorizar o login. Deve ser criado um para android, outro para Web e outro para Iphone. O do iphone não é obrigatório, mas do Android e Web devem ser feitos.
 13. Na tela escolha Android, coloque um nome qualquer, depois coloque o nome do pacote do seu projeto no flutter, se não souber, acesse o arquivo AndroidManifest, lá vai ta ele completo.
 14. Agora você precisa colocar o SHA1, da sua keystore de desenvolvimento. Ela normalmente fica dentro da pasta C:\Users\{Nome do Usuario}\.android\debug.keystore. Execute o comando abaixo, mudando apenas o nome do seu usuario do windows para localizar o arquivo.

    keytool -keystore C:\Users\{Nome do Usuario}\.android\debug.keystore
    -list -v

E copie o código SHA1 e cole na caixa de texto.
Por fim clique em **CRIAR**.

15. Repita o procedimento para criar o Client Id da web, mas nesse caso não precisa de SHA1.

#### Configurações no Supabase
1. Acesse o painel do **Supabase > Authentication**.
2. Clique em **Providers** e escolha o **Google**
3. Marque **Enable Sign in with Google** e preencha o campo Clients Id com os Ids criados no Google Cloud, separando eles por virgula. Obs: Para o IPhone existe um procedimento a mais a ser feito, tem que pesquisar ainda.
4. Clique em **Save**.
 
#### Configurações no Projeto
No arquivo LoginPage.dart, copie e cole o IdClient da Web na variavel webClientId. Pode ignorar a variável iosClientId. 

Dessa forma o projeto vai compilar e realizar o login usando o google.
