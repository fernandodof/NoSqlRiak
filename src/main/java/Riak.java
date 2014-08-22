
import beans.Pessoa;
import beans.Projeto;

import dao.RiakPersistence;
import java.util.List;

public class Riak {

    /**
     * @param args
     */
    public static void main(String[] args) {
        Pessoa pessoa = new Pessoa();
        pessoa.setMatricula("2011.2codes0445");
        pessoa.setNome("Cabinha");
        Projeto projeto = new Projeto();
        projeto.setCurso("ADS");
        projeto.setDescricao("Projeto de construcao da classe DBUTILS");
        projeto.setDisiplina("BDNC");
        projeto.setNota("9");
        projeto.setSemestre("5");
        pessoa.addProjeto(projeto);
        RiakPersistence riakPersistence = new RiakPersistence();
        riakPersistence.save(pessoa);

        
        Pessoa pessoa2 = riakPersistence.findByKey("2011.2codes0445");
        
        List<Pessoa> pessoas = riakPersistence.getAllPeople();
        for (Pessoa pessoa3 : pessoas) {
            System.out.println(pessoa3.getMatricula()+" "+pessoa3.getNome());
        }
    }
    
}
