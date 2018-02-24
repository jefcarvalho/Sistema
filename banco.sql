-- -----------------------------------------------------
-- Table `clientes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `clientes` (
  `idClientes` INT NOT NULL AUTO_INCREMENT ,
  `nomeCliente` VARCHAR(255) NOT NULL ,
  `documento` VARCHAR(20) NOT NULL ,
  `telefone` VARCHAR(20) NOT NULL ,
  `celular` VARCHAR(20) NULL ,
  `email` VARCHAR(100) NOT NULL ,
  `dataCadastro` DATE NULL ,
  `rua` VARCHAR(70) NULL ,
  `numero` VARCHAR(15) NULL ,
  `bairro` VARCHAR(45) NULL ,
  `cidade` VARCHAR(45) NULL ,
  `estado` VARCHAR(20) NULL ,
  `cep` VARCHAR(20) NULL ,
  PRIMARY KEY (`idClientes`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `produtos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `produtos` (
  `idProdutos` INT NOT NULL AUTO_INCREMENT ,
  `descricao` VARCHAR(80) NOT NULL ,
  `unidade` VARCHAR(10) NULL ,
  `precoCompra` DECIMAL(10,2) NULL ,
  `precoVenda` DECIMAL(10,2) NOT NULL ,
  `estoque` INT NOT NULL ,
  `estoqueMinimo` INT NULL ,
  PRIMARY KEY (`idProdutos`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `usuarios`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `usuarios` (
  `idUsuarios` INT NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(80) NOT NULL ,
  `rg` VARCHAR(20) NULL ,
  `cpf` VARCHAR(20) NOT NULL ,
  `rua` VARCHAR(70) NULL ,
  `numero` VARCHAR(15) NULL ,
  `bairro` VARCHAR(45) NULL ,
  `cidade` VARCHAR(45) NULL ,
  `estado` VARCHAR(20) NULL ,
  `email` VARCHAR(80) NOT NULL ,
  `senha` VARCHAR(45) NOT NULL ,
  `telefone` VARCHAR(20) NOT NULL ,
  `celular` VARCHAR(20) NULL ,
  `situacao` TINYINT(1)  NOT NULL ,
  `dataCadastro` DATE NOT NULL ,
  `nivel` INT NOT NULL ,
  PRIMARY KEY (`idUsuarios`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lancamentos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `lancamentos` (
  `idLancamentos` INT NOT NULL AUTO_INCREMENT ,
  `descricao` VARCHAR(255) NULL ,
  `valor` VARCHAR(15) NOT NULL ,
  `data_vencimento` DATE NOT NULL ,
  `data_pagamento` DATE NULL ,
  `baixado` TINYINT(1)  NULL ,
  `cliente_fornecedor` VARCHAR(255) NULL ,
  `forma_pgto` VARCHAR(100) NULL ,
  `tipo` VARCHAR(45) NULL ,
  `clientes_id` INT NULL ,
  PRIMARY KEY (`idLancamentos`) ,
  INDEX `fk_lancamentos_clientes1` (`clientes_id` ASC) ,
  CONSTRAINT `fk_lancamentos_clientes1`
    FOREIGN KEY (`clientes_id` )
    REFERENCES `clientes` (`idClientes` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `os`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `os` (
  `idOs` INT NOT NULL AUTO_INCREMENT ,
  `dataInicial` DATE NULL ,
  `dataFinal` DATE NULL ,
  `garantia` VARCHAR(45) NULL ,
  `descricaoProduto` VARCHAR(150) NULL ,
  `defeito` VARCHAR(150) NULL ,
  `status` VARCHAR(45) NULL ,
  `observacoes` VARCHAR(150) NULL ,
  `laudoTecnico` VARCHAR(150) NULL ,
  `valorTotal` VARCHAR(15) NULL ,
  `clientes_id` INT NOT NULL ,
  `usuarios_id` INT NOT NULL ,
  `lancamento` INT NULL ,
  `faturado` TINYINT(1)  NOT NULL ,
  PRIMARY KEY (`idOs`) ,
  INDEX `fk_os_clientes1` (`clientes_id` ASC) ,
  INDEX `fk_os_usuarios1` (`usuarios_id` ASC) ,
  INDEX `fk_os_lancamentos1` (`lancamento` ASC) ,
  CONSTRAINT `fk_os_clientes1`
    FOREIGN KEY (`clientes_id` )
    REFERENCES `clientes` (`idClientes` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_os_usuarios1`
    FOREIGN KEY (`usuarios_id` )
    REFERENCES `usuarios` (`idUsuarios` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_os_lancamentos1`
    FOREIGN KEY (`lancamento` )
    REFERENCES `lancamentos` (`idLancamentos` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `servicos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `servicos` (
  `idServicos` INT NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(45) NOT NULL ,
  `descricao` VARCHAR(45) NULL ,
  `preco` DECIMAL(10,2) NOT NULL ,
  PRIMARY KEY (`idServicos`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `servicos_os`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `servicos_os` (
  `idServicos_os` INT NOT NULL AUTO_INCREMENT ,
  `os_id` INT NOT NULL ,
  `servicos_id` INT NOT NULL ,
  `subTotal` VARCHAR(15) NULL ,
  PRIMARY KEY (`idServicos_os`) ,
  INDEX `fk_servicos_os_os1` (`os_id` ASC) ,
  INDEX `fk_servicos_os_servicos1` (`servicos_id` ASC) ,
  CONSTRAINT `fk_servicos_os_os1`
    FOREIGN KEY (`os_id` )
    REFERENCES `os` (`idOs` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicos_os_servicos1`
    FOREIGN KEY (`servicos_id` )
    REFERENCES `servicos` (`idServicos` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `produtos_os`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `produtos_os` (
  `idProdutos_os` INT NOT NULL AUTO_INCREMENT ,
  `quantidade` INT NOT NULL ,
  `os_id` INT NOT NULL ,
  `produtos_id` INT NOT NULL ,
  `subTotal` VARCHAR(15) NULL ,
  PRIMARY KEY (`idProdutos_os`) ,
  INDEX `fk_produtos_os_os1` (`os_id` ASC) ,
  INDEX `fk_produtos_os_produtos1` (`produtos_id` ASC) ,
  CONSTRAINT `fk_produtos_os_os1`
    FOREIGN KEY (`os_id` )
    REFERENCES `os` (`idOs` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produtos_os_produtos1`
    FOREIGN KEY (`produtos_id` )
    REFERENCES `produtos` (`idProdutos` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `vendas`
-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `vendas` ( 
 `idVendas` INT NOT NULL AUTO_INCREMENT , 
 `dataVenda` DATE NULL ,  
 `valorTotal` VARCHAR(45) NULL ,  
 `desconto` VARCHAR(45) NULL ,  
 `faturado` TINYINT(1)  NULL , 
 `clientes_id` INT(11) NOT NULL , 
 `usuarios_id` INT(11) NULL , 
 `lancamentos_id` INT(11) NULL , 
 PRIMARY KEY (`idVendas`) ,  
 INDEX `fk_vendas_clientes1` (`clientes_id` ASC) , 
 INDEX `fk_vendas_usuarios1` (`usuarios_id` ASC) , 
 INDEX `fk_vendas_lancamentos1` (`lancamentos_id` ASC) , 
 CONSTRAINT `fk_vendas_clientes1`   
 FOREIGN KEY (`clientes_id` )    
 REFERENCES `clientes` (`idClientes` )    
 ON DELETE NO ACTION    
 ON UPDATE NO ACTION, 
 CONSTRAINT `fk_vendas_usuarios1`    
 FOREIGN KEY (`usuarios_id` )    
 REFERENCES `usuarios` (`idUsuarios` )   
 ON DELETE NO ACTION   
 ON UPDATE NO ACTION, 
 CONSTRAINT `fk_vendas_lancamentos1`    FOREIGN KEY (`lancamentos_id` )    REFERENCES `lancamentos` (`idLancamentos` )    ON DELETE NO ACTION    ON UPDATE NO ACTION)
 ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `itens_de_vendas`
-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `itens_de_vendas` (  
`idItens` INT NOT NULL AUTO_INCREMENT , 
 `subTotal` VARCHAR(45) NULL ,  
`quantidade` INT(11) NULL ,  
`vendas_id` INT NOT NULL ,  
`produtos_id` INT(11) NOT NULL , 
 PRIMARY KEY (`idItens`) , 
 INDEX `fk_itens_de_vendas_vendas1` (`vendas_id` ASC) ,  
INDEX `fk_itens_de_vendas_produtos1` (`produtos_id` ASC) , 
 CONSTRAINT `fk_itens_de_vendas_vendas1`   
 FOREIGN KEY (`vendas_id` )   
 REFERENCES `vendas` (`idVendas` )   
 ON DELETE NO ACTION   
 ON UPDATE NO ACTION, 
 CONSTRAINT `fk_itens_de_vendas_produtos1`   
 FOREIGN KEY (`produtos_id` )   
 REFERENCES `produtos` (`idProdutos` )   
 ON DELETE NO ACTION    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `anexos`
-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `anexos` ( 
`idAnexos` INT NOT NULL AUTO_INCREMENT ,  
`anexo` VARCHAR(45) NULL , 
`thumb` VARCHAR(45) NULL ,  
`url` VARCHAR(300) NULL , 
`path` VARCHAR(300) NULL , 
`os_id` INT(11) NOT NULL ,  
PRIMARY KEY (`idAnexos`) ,  
INDEX `fk_anexos_os1` (`os_id` ASC) ,  
CONSTRAINT `fk_anexos_os1`    
FOREIGN KEY (`os_id` )   
REFERENCES `os` (`idOs` )    
ON DELETE NO ACTION    
ON UPDATE NO ACTION)ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `emitente`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `emitente` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(255) NULL ,
  `cnpj` VARCHAR(45) NULL ,
  `ie` VARCHAR(50) NULL ,
  `rua` VARCHAR(70) NULL ,
  `numero` VARCHAR(15) NULL ,
  `bairro` VARCHAR(45) NULL ,
  `cidade` VARCHAR(45) NULL ,
  `uf` VARCHAR(20) NULL ,
  `telefone` VARCHAR(20) NULL ,
  `email` VARCHAR(255) NULL ,
  `url_logo` VARCHAR(225) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `ci_sessions`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS  `ci_sessions` (
  session_id varchar(40) DEFAULT '0' NOT NULL,
  ip_address varchar(45) DEFAULT '0' NOT NULL,
  user_agent varchar(120) NOT NULL,
  last_activity int(10) unsigned DEFAULT 0 NOT NULL,
  user_data text NOT NULL,
  PRIMARY KEY (session_id),
  KEY `last_activity_idx` (`last_activity`)
);


INSERT INTO `usuarios` (`idUsuarios`, `nome`, `rg`, `cpf`, `rua`, `numero`, `bairro`, `cidade`, `estado`, `email`, `senha`, `telefone`, `celular`, `situacao`, `dataCadastro`, `nivel`) VALUES
(1, 'admin', 'MG-25.502.560', '600.021.520-87', 'Rua Acima', '12', 'Alvorada', 'Brasília', 'DF', 'admin@admin.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', '0000-0000', '', 1, '2013-11-22', 1);


