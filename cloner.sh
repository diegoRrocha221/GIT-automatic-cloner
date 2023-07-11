#!/bin/bash

# Defina o diretório onde você deseja clonar o repositório
diretorio_clonagem="/caminho/para/o/repositorio"

# Defina a URL SSH do repositório Git que você deseja clonar
url_repositorio="git@github.com:seu-usuario/seu-repositorio.git"

# Verifique se o diretório de clonagem já existe. Se não existir, crie-o.
if [ ! -d "$diretorio_clonagem" ]; then
  mkdir -p "$diretorio_clonagem"
fi

# Mude para o diretório de clonagem
cd "$diretorio_clonagem"

# Verifique se já foi feito um clone hoje (verificando se o arquivo 'last_clone.txt' existe e tem a data atual)
if [ -f "last_clone.txt" ] && [ "$(date +%F)" = "$(cat last_clone.txt)" ]; then
  echo "Já foi feito um clone hoje. O script será encerrado."
  exit 0
fi

# Clone o repositório via SSH
git clone "$url_repositorio"

# Salve a data atual no arquivo 'last_clone.txt'
date +%F > last_clone.txt

echo "Clone concluído com sucesso."
