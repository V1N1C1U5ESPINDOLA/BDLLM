# Sistema de Consultas SQL com LangChain e OpenAI

Este projeto permite gerar consultas SQL automaticamente a partir de texto em linguagem natural, usando a API do OpenAI para processar o texto e converter em comandos SQL, e o banco de dados PostgreSQL para armazenar e consultar os dados.

## Tecnologias Utilizadas

- **LangChain**: Para integrar o modelo OpenAI com o fluxo de trabalho.
- **OpenAI**: Para utilizar o modelo GPT para gerar consultas SQL.
- **psycopg2**: Para se conectar ao banco de dados PostgreSQL.
- **dotenv**: Para carregar variáveis de ambiente, como a chave de API do OpenAI.
- **PostgreSQL**: Banco de dados utilizado para armazenar informações de pacientes, agendamentos e comparecimento.

## Pré-requisitos

Antes de executar o código, é necessário configurar alguns itens.

### 1. **Instalação das dependências**

Instale as bibliotecas necessárias utilizando o `pip`:

```bash
pip install langchain_openai psycopg2 dotenv openai
```
### 2. Depois que tudo esiver instalado utilize:

```bash
python script_name.py
```
