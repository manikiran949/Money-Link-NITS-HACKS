from flask import Flask, jsonify, request, render_template
from PyPDF2 import PdfReader
from langchain_openai import OpenAIEmbeddings, OpenAI
from langchain.text_splitter import CharacterTextSplitter
from langchain_community.vectorstores import FAISS
from langchain.chains.question_answering import load_qa_chain

OPENAI_API_KEY = ""

app = Flask(__name__)

pdfreader = PdfReader(r"C:\Users\saite\Downloads\nitshacks.pdf")

raw_text = ''
for i, page in enumerate(pdfreader.pages):
    content = page.extract_text()
    if content:
        raw_text += content

text_splitter = CharacterTextSplitter(
    separator="\n",
    chunk_size=800,
    chunk_overlap=200,
    length_function=len,
)
texts = text_splitter.split_text(raw_text)
embeddings = OpenAIEmbeddings(openai_api_key=OPENAI_API_KEY)
document_search = FAISS.from_texts(texts, embeddings)
qa_chain = load_qa_chain(OpenAI(openai_api_key=OPENAI_API_KEY), chain_type="stuff")

def generate_answer(input_query):
    """Process the input query and return an answer."""
    docs = document_search.similarity_search(input_query)
    answer = qa_chain.run(input_documents=docs, question=input_query)
    return answer

@app.route("/ask", methods=["POST"])
def ask():
    data = request.get_json()
    question = data.get("question", "")
    
    if not question:
        return jsonify({"error": "Question is required"}), 400

    answer = generate_answer(question)
    return jsonify({"answer": answer})

if __name__ == "__main__":
    # app.run(host="192.168.144.105", port=5000)
    app.run(host="192.168.248.26", port=5000)