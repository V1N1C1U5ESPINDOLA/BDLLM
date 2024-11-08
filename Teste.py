import psycopg2
from langchain_openai import OpenAI  
from langchain.prompts import PromptTemplate
from dotenv import load_dotenv
import os

load_dotenv()

openai_api_key = os.getenv('OPENAI_API_KEY')

conn = psycopg2.connect(
    dbname="postgres",
    user="postgres",
    password="postgres",
    host="localhost",
    port="5432"
)
cursor = conn.cursor()

llm = OpenAI(openai_api_key=openai_api_key, temperature=0.1)

template = """
Converta o seguinte texto em uma consulta SQL. Considere as seguintes tabelas:
- `pacientes` com colunas `id`, `nome`, `data_nascimento`
- `agendamentos` com colunas `id`, `paciente_id` (FK para `pacientes.id`), `data_agendamento`, `hora_agendamento`
- `comparecimento` com colunas `id`, `agendamento_id` (FK para `agendamentos.id`), `compareceu` (BOOLEAN), `data_comparecimento`

Instrucao: {text}
"""
prompt = PromptTemplate(input_variables=["text"], template=template)

chain = prompt | llm  

def text_to_sql(text):
    print("Buscando informacoes no banco de dados ...\n")
    try:
        sql_query = chain.invoke(text) 
        print("Consulta SQL ^-^ :\n{",sql_query,"\n}\n")
        cursor.execute(sql_query)
        results = cursor.fetchall()
        formatted_results = []
        for row in results:
            formatted_row = "\t".join(str(value) for value in row)
            formatted_results.append(formatted_row)
        return "\n".join(formatted_results)
    except psycopg2.Error as db_error:
        return f"Erro no banco de dados >.< : {db_error}"
    except Exception as e:
        return f"Erro ao gerar a consulta ;-; : {e}"

prompt_text = input("O que voce gostaria de saber acerca dos pacientes ? \n")
results = text_to_sql(prompt_text)
print("Resposta:\n",results)

cursor.close()
conn.close()
