#!/bin/bash

# Extrair todos os identificadores de texto (msgids) do arquivo
xgettext -d helloworld -o helloworld.pot helloworld_gettext.cpp && \

# Criar arquivo PO de traducao de diversas linguagens
# Portugues (Brasil), Ingles (EUA), Espanhol (Espanha)
msginit --no-translator -l pt_BR -i helloworld.pot -o helloworld_ptBR.po && \
msginit --no-translator -l en_US -i helloworld.pot -o helloworld_enUS.po && \
msginit --no-translator -l es_ES -i helloworld.pot -o helloworld_esES.po && \

# Inserindo traducoes nos arquivos PO
sed -i '/#: /,$ s/""/"Olá Mundo!"/' helloworld_ptBR.po && \
sed -i 's/ASCII/UTF-8/' helloworld_ptBR.po && \
sed -i '/#: /,$ s/""/"Hello World!"/' helloworld_enUS.po && \
sed -i 's/ASCII/UTF-8/' helloworld_enUS.po && \
sed -i '/#: /,$ s/""/"Hola Mundo!"/' helloworld_esES.po && \
sed -i 's/ASCII/UTF-8/' helloworld_esES.po && \

# Criando estrutura de diretorios
mkdir -p pt_BR.utf8/LC_MESSAGES && \
mkdir -p en_US.utf8/LC_MESSAGES && \
mkdir -p es_ES.utf8/LC_MESSAGES && \

# Compilando os arquivos PO para MO
msgfmt helloworld_ptBR.po -o pt_BR.utf8/LC_MESSAGES/helloworld.mo && \
msgfmt helloworld_enUS.po -o en_US.utf8/LC_MESSAGES/helloworld.mo && \
msgfmt helloworld_esES.po -o es_ES.utf8/LC_MESSAGES/helloworld.mo && \

# Compilando o programa
g++ helloworld_gettext.cpp -o helloworld_gettext

# Rodando com as 3 linguagens
LANGUAGE=pt_BR.utf8 ./helloworld_gettext
LANGUAGE=en_US.utf8 ./helloworld_gettext
LANGUAGE=es_ES.utf8 ./helloworld_gettext