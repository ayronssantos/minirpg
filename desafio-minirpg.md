#Mini RPG

a ideia é criar um RPG com um sistema de batalha

O sistema contem unidades que podem ser aliadas ou inimigas e que batalham entre sí

as unidades criadas customizadas devem poder ser colocadas tanto como unidades aliadas como inimigas

não precisa usar input, só criar tudo estaticamente no proprio main pra facilitar


<!-- ##Parte 1 Base RPG

- Criar uma classe Unidade que sirva de base para as unidades, ela deve conter como atributos
  -  nome
  -  health
  -  attack
  -  speed (iremos usar na parte 4)
- Todos os atributos precisam ser privados, e se necessário podem ser criados o get para acesso.
- Deve conter o método toString que retorna os atributos em um dicionário

- Apartir dai deve criar 3 unidades, Guerreiro, Mago, Curandeiro
- Após isso no método main criar uma unidade de cada um deles e chamar o método toString() -->


##Parte 2 Sistema de Batalha básico

Agora que a gente tem unidades pra trabalhar vamos fazem com que elas batalhem!

- Agora as nossas unidades precisam chamar um método de atacar independente de qual unidade esteja chamando. O método recebe como parâmetro uma unidade que será atacada.
- para que seja possível atacar uma outra unidade, precisa criar um método que seja possível setar o hp da nossa unidade.
- para não perder o valor do hp de referência seria bom ter uma variável para o hp atual
- o nosso hp atual não deveria ser menor que 0 ou maior que o hp;
- ao efetuar o ataque o método deveria printar quem atacou, quem recebeu o dano e quanto foi de dano
- o dano recebido será o attack atual da unidade;
- agora é só voltar ao método main e escolher uma das unidades criadas e atacar uma outra unidade


##Parte 3 Magias

- Agora ta na hora de a gente usar magias.
- para facilitar o contexto, cada unidade vai poder usar apenas uma magia
- Assim como o ataque toda unidade deveria ser capaz de usar uma magia, no momento a magia pode atingir uma ou mais unidades
- Toda magia gasta mana, deveria ter um novo atributo de mana, custo da magia e recuperacao de mana (Usaremos a recuperação de mana na parte 5)
- para usar as magias precisa ter a mana necessária para usar, por enquanto se tentar usar a magia retornara um print dizendo que não possui mana o suficiente e caso tenha deveria gastar a mana ao usar.
- É preciso incluir um metódo de recuperação de mana, assim como o hp, a mana não deveria ser maior que a mana maxima
- Cada unidade possui seu poder especial
  - O guerreiro usa uma estocada, ele ataca uma unidade aleatória selecionada com o dano total do attack * 2
  - O mago usa uma bola de fogo, ele ataca todas as unidades selecionadas, o dano é o attack dividido pela quantidade de unidades selecionadas em cada unidade
  - O Curandeiro cura uma unidade aleatória selecionada com o total do attack
-Todas as magias devem printar quem usou, quem foi/foram as unidades atingidas e o valor
- Agora é só voltar pra o metodo main e testar a magia de todos as 3 unidades e após isso printar as unidades.


##Parte 4 Sistema de Batalha

 Agora que a gente já tem um sistema básico, vamos precisar alterar algumas coisas para permitir que o nosso sistema funcione incluindo uma classe de batalha

 - Crie uma classe de sistema de batalha
 - A classe deveria conter uma lista de aliados e uma lista de inimigos
 - deveria ter um método que inclui um aliado na lista de aliados e outra para o inimigo na lista de inimigos
 - deve ter outra lista chamada ordem de batalha que irá ter todas as unidades por ordem de iniciativa
   - a ordem deve ser dada baseada na speed da unidade, quanto maior, mais rápido e consequentemente deve ser o primeiro (pra facilitar a classe unidade pode implementar comparable ou pode ser feito na mão)
   - (opcional) se caso a unidade aliada tiver a mesma velocidade que a velocidade inimiga ele deve ir primeiro
   - depois de ordernar as unidades deve printar a ordem de todas as unidades na batalha.


##Parte 5 Adaptando para o Sistema de Batalha

Agora que a gente já tem bastante coisa nas nossas classes, é necessário adaptar as nossas unidades para o nosso sistema de batalha

Para isso nossas unidades precisam ter as seguintes alterações:
- As unidades precisam ter uma lista de unidades aliadas e uma lista de unidades inimigas
  - As unidades do jogador deveriam ter os aliados do jogador e as unidades inimigas deveriam ter a unidades inimigas como suas aliadas, assim como o inverso da outra lista.
  - Na classe de sistema de batalha a gente precisa passar a referência das nossas listas aliadas e inimigas para os nossas unidades
  - Para facilitar a implementação da batalha e futuramente o uso de AI, vamos criar dois métodos na nossa classe
    - Um método que retorna uma unidade amiga aleatória da nossa lista de aliados
    - Um método que retorna uma unidade inimiga aleatória da nossa lista de aliados
  - Agora no nosso método de atacar não deveria receber nenhum parâmetro e deveria retornar uma lista de unidades e deveria ser alterado para:
    - todas as 3 unidades deveriam pegar uma unidade inimiga aleatória, atacar, e retorna-las
    - Assim como o ataque, todas as magias deveriam não ter nenhum parâmetro e deveriam fazer o mesmo comportamento dado anteriormente, retornando a lista de inimigos atacados.


##Parte 6 Sistema completo de batalha

Agora que ta tudo configurado para usar o nosso sistema vamos começar implementando o sistema básico

- Vamos adicionar um comportamento aleatório para cada unidade, ou ela ataca ou ela usa magia
  - como a gente já tem a lista de unidades pela iniciativa, agora ta na hora de a gente começar a fazer as ações das unidades a cada turno
  - criar um metódo na classe de sistema de batalha que irá chamar o método que adiciona as nossas unidades na lista de iniciativa
  - Agora devemos criar um loop, e devemos verificar se a nossa lista de jogadores ou inimigos está vazia
  - Se caso uma delas esteja, vamos sair do loop e definir o time vencedor baseado na lista que não está vazia
  - Assim que o turno da unidade começa, ela recupera a sua mana
  - seguindo a ordem da iniciativa,deve randomizar em dois resultados, um para o ataque e outro para magia (é preciso verificar antes se a unidade possui mana para usar magia, caso não, a unidade irá atacar diretamente)
  - em seguida deve receber a unidade ou as unidades atacadas e verificar se o hp é zero, se for zero, a unidade deve ser removida da lista de iniciativa e da lista de jogadores ou inimigos a qual ela pertence
  - após a realização do ataque ou da magia a unidade deve passar o turno para a próxima unidade
  - o loop deve seguir até que saia o resultado do time vencedor e printar na tela o time que venceu e também printar as duas listas de unidades

Agora é só chamar a simulacão da batalha na classe main

##Parte 7 Unidades Inteligentes

Agora que nosso sistema está completo, vamos adicionar uma AI para as nossas unidades

- Para injetar a AI precisamos vamos criar algumas classes
  - Criar uma classe AI que irá ter um método de ação, esse método irá retornar uma lista de Unidades e irá ter como parâmetro a unidade responsável para chamar o método
  - na nossa classe unidade precisamos criar um atributo do tipo AI e criar um metodo que chama nosso metodo de ação da AI e retorna passando como paramêtro a propria unidade e retornando a lista de unidades
  - Agora em vez de a gente randomizar o ataque e a magia, vamos implementar o comportamento da AI baseado na implementação de AI que a gente configurar.
  - vamos trocar esse comportamento pelo método de ação na nossa unidade usando a AI
  - Agora que a gente tem uma implementação abstrata da AI, podemos criar nossas AI customizadas para injertamos o comportamento desejado a nossas unidade, para isso vamos criar uma Implementação da AI
    - Criar uma classe de AI chamada Porradeiro
      - no método action vamos retornar o método de ataque da unidade.
    -  Criar uma classe de AI chamada Magador(não achei um nome melhor)
      - no método action vamos retornar o método de magia da unidade (quando a unidade não tiver mana necessária deve retornar uma lista vazia no método de magia e printar, o nome da unidade avisado que a magia falhou).

Agora na nossa classe main, vamos injetar uma AI nas nossas unidades, escolha a que desejar!

Como extra pode implementar duas novas AIs
- Uma AI que usa magias sempre que puder, quando não tiver mana suficiente, deve usar o atacar
- Uma AI que usa aleatóriamente ataque ou magia, mas se não tiver mana suficiente, deve usar o ataque

Acabou!