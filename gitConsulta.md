Windows PowerShell
Copyright (C) Microsoft Corporation. All rights reserved.

PS C:\Users\MDQ154_1\Documents\SQL Server Management Studio> cd C:\Users\MDQ154_1\source\repos /aqui faço cd para acessar a pasta, preciso colocar a url da pasta repos.

PS C:\Users\MDQ154_1\source\repos> git clone https://github.com/moldemaq-ti/movtech-bi   /trago o repositório do git para minha pasta.

Cloning into 'movtech-bi'...
remote: Enumerating objects: 216, done.
remote: Counting objects: 100% (216/216), done.
remote: Compressing objects: 100% (167/167), done.
remote: Total 216 (delta 91), reused 168 (delta 49), pack-reused 0 (from 0)
Receiving objects: 100% (216/216), 89.88 KiB | 5.62 MiB/s, done.
Resolving deltas: 100% (91/91), done.


PS C:\Users\MDQ154_1\source\repos> cd movtech-bi    /aqui estou acessando a pasta.

PS C:\Users\MDQ154_1\source\repos\movtech-bi> git checkout main   /garantir que estou na versão mais rescente 
Already on 'main'
Your branch is up to date with 'origin/main'.

PS C:\Users\MDQ154_1\source\repos\movtech-bi> git pull
Already up to date.

PS C:\Users\MDQ154_1\source\repos\movtech-bi> git checkout -b fix/remover-coluna-teste   / aqui estou criando minha branch, o "remover-coluna-teste e o titulo da descrição da branch.

Switched to a new branch 'fix/remover-coluna-teste'  / branch criada com sucesso.
PS C:\Users\MDQ154_1\source\repos\movtech-bi>

git status  / mostra minha brunch atual e os arquivos alterados 

git add .
git commit -m "tirei as linhas erradas"   / aqui estou comentando a branch o que mudou e porque.

git push -u origin  /envia a branch para o git hub






