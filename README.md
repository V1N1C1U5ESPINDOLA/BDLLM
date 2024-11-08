# Sistema de Consultas SQL com LangChain e OpenAI

Este projeto permite gerar consultas SQL automaticamente a partir de texto em linguagem natural, usando a API do OpenAI para processar o texto e converter em comandos SQL, e o banco de dados PostgreSQL para armazenar e consultar os dados.

## Tecnologias Utilizadas

- **LangChain**: Para integrar o modelo OpenAI com o fluxo de trabalho.
- **OpenAI**: Para utilizar o modelo GPT para gerar consultas SQL.
- **psycopg2**: Para se conectar ao banco de dados PostgreSQL.
- **dotenv**: Para carregar vari�veis de ambiente, como a chave de API do OpenAI.
- **PostgreSQL**: Banco de dados utilizado para armazenar informa��es de pacientes, agendamentos e comparecimento.

## Pr�-requisitos

Antes de executar o c�digo, � necess�rio configurar alguns itens.

### 1. **Instala��o das depend�ncias**

Instale as bibliotecas necess�rias utilizando o `pip`:

```bash
pip install langchain_openai psycopg2 dotenv openai
```
### 2. Depois que tudo esiver instalado utilize:

```bash
python script_name.py
```
