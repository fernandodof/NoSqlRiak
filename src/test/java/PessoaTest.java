/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import beans.Pessoa;
import beans.Projeto;
import dao.RiakPersistence;
import junit.framework.TestCase;

/**
 *
 * @author fernando
 */
public class PessoaTest extends TestCase {

    RiakPersistence riakPersistence = new RiakPersistence();

    public void testSave() {
        Pessoa pessoa = new Pessoa();
        pessoa.setMatricula("2010.2codes0445");
        pessoa.setNome("Cabinha");
        pessoa.setCurso("ADS");
        Projeto projeto = new Projeto();
        projeto.setCurso("ADS");
        projeto.setDescricao("Projeto pizzaria");
        projeto.setDisciplina("BDNC");
        projeto.setNota("9");
        projeto.setSemestre("5");
        pessoa.addProjeto(projeto);
        assertTrue(riakPersistence.save(pessoa));
    }

    public void testUpdate() {
        Pessoa pessoa = riakPersistence.findByKey("2010.2codes0445");
        pessoa.setNome("Outro nome");
        assertTrue(riakPersistence.save(pessoa));
    }
    
    public void testListPeople(){
        assertNotNull(riakPersistence.getAllPeople());
    }
    
    public void testRiakObject(){
        assertNotNull(riakPersistence.getRiakObject("2010.2codes0445"));
    }
    
    public void testFindPessoa(){
        assertNotNull(riakPersistence.findByKey("2010.2codes0445"));
    }
    
    
}
