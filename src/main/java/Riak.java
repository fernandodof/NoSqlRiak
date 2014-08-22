
import beans.Pessoa;
import beans.Projeto;

import dao.RiakPersistence;

public class Riak {

    /**
     * @param args
     */
    public static void main(String[] args) {
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
        pessoa.addProjeto(projeto);
        RiakPersistence riakPersistence = new RiakPersistence();
        riakPersistence.save(pessoa);

        
        for (Projeto projeto1 : riakPersistence.getProjectsByPessoaId("2010.2codes0445")) {
            System.out.println(projeto1.getCurso());
        }
        System.out.println(riakPersistence.getRiakObject("2010.2codes0445").getValueAsString());
    }
    
}
