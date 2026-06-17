/*****************************************************************************************
 * Objetivo: controla a rota de produto
 * Data:     10/06/2026
 * Autor:    Cosme Ribeiro
 * Versão:   1.0
 *****************************************************************************************/


// importe do express
const controlerProduto = require("../controller/produto/controler_produto.js")

const express = require("express")

//cria objeto de rota para o arquivo
const router = express.Router()


//  Importa o body-parser 
const bodyParser = require("body-parser")
//  Cria a função que processa o JSON 
const boddyParserJSON = bodyParser.json()


//////////////////////////////////////////////////////////////////////////
// PRODUTO
//////////////////////////////////////////////////////////////////////////



// Buscar produto
router.get("/:id", async function(request,response){

    let id = request.params.id

    let result = await controlerProduto.buscarProduto(id)

    response.status(result.status_code)
    response.json(result)

})

// Listar produtos
router.get("/", async function(request,response){

    let result = await controlerProduto.listarProdutos()

    response.status(result.status_code)
    response.json(result)

})




//exporte pro app ter acessoas rota do genero
module.exports = router