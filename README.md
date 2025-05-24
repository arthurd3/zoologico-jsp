# Zoológico JF

Sistema de gerenciamento para o **Zoológico Municipal de Juiz de Fora**, desenvolvido com **JSP** para a camada de visualização e **Bootstrap** para o design responsivo e estilização.

---

## Tecnologias Utilizadas

- Java (Servlets e JSP)
- Bootstrap (estilização)
- MySQL (banco de dados)
- Docker Compose (orquestração do ambiente)

---

## Funcionalidades

- **CRUD de Clientes**  
  Cadastrar, listar, editar e remover visitantes do zoológico.

- **CRUD de Animais**  
  Gerenciar os animais presentes no zoológico.

- **CRUD de Recintos**  
  Controle total sobre os recintos onde os animais são abrigados.

- **CRUD de Alimentos**  
  Administração dos alimentos fornecidos aos animais.

- **Agendamento de Limpeza**  
  Possibilidade de marcar a limpeza de um recinto.

---

## Perfis de Acesso

- **Administrador:**  
  - Administrador: Email: adm@gmail.com, Senha: 123 ,
  - Acesso total ao sistema: gerenciar clientes, animais, recintos e alimentos.  
  - Pode cadastrar, editar e remover qualquer registro.

- **Funcionário:**  
  - Email: Email: daniel@example.com, Senha: 123
  - Gerenciamento completo de animais, recintos e alimentos.  
  - Pode listar, cadastrar, editar e remover registros relacionados a essas áreas.

- **Clientes:**
  - Email: beatriz@example.com, Senha: 123 
  - Vistitar areas do site
  - Pode se cadastrar e fazer login e acessar areas visiveis a clientes
---

## Banco de Dados

Para subir o banco de dados **MySQL** com Docker Compose:

```bash
  docker compose up
```

## Authors

- [@arthurcamp.ss](https://www.github.com/arthurd3)

