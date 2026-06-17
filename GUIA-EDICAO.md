# 📝 Guia de Edição do Site — Filhos da Tribo

Este guia explica como atualizar produtos, fotos e informações de contato do site **sem precisar de programação**.

---

## 🔑 Acesso

1. Acesse [github.com](https://github.com) e faça login na conta **Anderson-2307**
2. Clique no repositório **filhosdatribo**

---

## 🖼️ Como trocar ou adicionar uma foto

### Passo 1 — Abra a pasta de imagens
- No repositório, clique na pasta **`imagens`**

### Passo 2 — Envie a nova foto
- Clique no botão **"Add file"** (canto superior direito)
- Selecione **"Upload files"**
- Arraste a foto ou clique para selecionar do seu computador
- **Importante:** use nomes sem espaços e sem acentos. Exemplos:
  - ✅ `Muringa_Rosa_1.jpeg`
  - ✅ `Camiseta_Borboleta.jpeg`
  - ❌ `foto da muringa.jpeg`
  - ❌ `camisetão.jpeg`
- Role até o final da página e clique em **"Commit changes"** (botão verde)

---

## 🪴 Como adicionar ou editar um produto (Muringas, Calendários, etc.)

### Passo 1 — Abra o arquivo de produtos
- No repositório, clique na pasta **`_data`**
- Clique no arquivo **`produtos.json`**

### Passo 2 — Abra o editor
- Clique no ícone de **lápis ✏️** (canto superior direito do arquivo)

### Passo 3 — Entenda a estrutura

Cada produto tem este formato:

```json
{
  "id": "nome-unico-sem-espacos",
  "nome": "Nome que aparece no site",
  "categoria": "Cerâmica Pintada",
  "descricao": "Texto descritivo do produto que aparece no card.",
  "destaque": false,
  "imagens": ["/imagens/NomeDaFoto1.jpeg", "/imagens/NomeDaFoto2.jpeg"]
}
```

### Passo 4 — Adicionar um produto novo

Copie um bloco existente e cole antes do `]` final, separado por vírgula. Exemplo:

```json
  },
  {
    "id": "muringa-rosa",
    "nome": "Muringa Rosa com Flores",
    "categoria": "Cerâmica Pintada",
    "descricao": "Filtro de barro pintado à mão com rosas silvestres em rosa e branco. Peça única.",
    "destaque": false,
    "imagens": ["/imagens/Muringa_Rosa_1.jpeg"]
  }
]
```

### Passo 5 — Salvar
- Role até o final
- Clique em **"Commit changes"** → **"Commit changes"** (botão verde)

---

## 👕 Como adicionar ou editar uma camiseta

### Passo 1 — Abra o arquivo de camisetas
- Na pasta **`_data`**, clique em **`camisetas.json`**
- Clique no **lápis ✏️**

### Passo 2 — Estrutura de cada camiseta

```json
{
  "id": "nome-unico",
  "nome": "Nome da Camiseta",
  "descricao": "Descrição curta que aparece no hover",
  "imagem": "/imagens/NomeDaFoto.jpeg"
}
```

### Passo 3 — Adicionar nova camiseta

Cole um novo bloco antes do `]` final:

```json
  },
  {
    "id": "camiseta-borboleta",
    "nome": "Camiseta Borboleta",
    "descricao": "Estampa aquarelada de borboletas coloridas",
    "imagem": "/imagens/Camiseta_Borboleta.jpeg"
  }
]
```

- Clique em **"Commit changes"**

---

## 📞 Como atualizar WhatsApp, Instagram ou e-mail

### Passo 1 — Abra o arquivo de configuração
- Na pasta **`_data`**, clique em **`config.json`**
- Clique no **lápis ✏️**

### Passo 2 — Edite os dados

```json
{
  "whatsapp": "5571999999999",
  "instagram": "filhosdatribo",
  "email": "contato@filhosdatribo.com.br",
  "endereco": "Salvador, Bahia, Brasil"
}
```

- **whatsapp:** número completo com DDI (55) + DDD + número, **sem espaços ou traços**
- **instagram:** só o @ sem o símbolo (ex: `filhosdatribo`)
- Clique em **"Commit changes"**

---

## ⏱️ Quanto tempo até o site atualizar?

Após salvar qualquer alteração, o Netlify detecta a mudança e **atualiza o site em cerca de 1 a 2 minutos** automaticamente.

---

## ⚠️ Cuidados importantes

| Faça ✅ | Evite ❌ |
|---|---|
| Nomes de arquivo sem espaços | `foto da muringa.jpeg` |
| Nomes sem acentos ou cedilha | `murinhã.jpeg` |
| Sempre fechar `"` aspas | Deixar aspas abertas |
| Vírgula entre produtos | Esquecer a vírgula separadora |
| Salvar clicando em "Commit changes" | Fechar a aba sem salvar |

---

## 🆘 Deu erro? Reverta para a versão anterior

Se algo der errado, o GitHub guarda o histórico de todas as versões:
1. Abra o arquivo com problema
2. Clique em **"History"** (histórico)
3. Clique na versão anterior que funcionava
4. Clique em **"..."** → **"Revert"** ou simplesmente copie o conteúdo e cole de volta

---

*Dúvidas? Fale com o desenvolvedor do site.*
