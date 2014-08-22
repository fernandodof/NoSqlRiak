
import beans.Pessoa;
import beans.Projeto;

import com.basho.riak.client.RiakException;
import dao.RiakPersistence;

public class Riak {

    /**
     * @param args
     */
    public static void main(String[] args) {
            Pessoa pessoa = new Pessoa();
            pessoa.setCpf("12345");
            pessoa.setNome("Caiana");
            Projeto projeto = new Projeto();
            projeto.setCurso("ADS");
            projeto.setDescricao("Projeto de construcao da classe DBUTILS");
            projeto.setDisiplina("BDNC");
            projeto.setNota("9");
            projeto.setSemestre("5");
            pessoa.addProjeto(projeto);
            RiakPersistence riakPersistence = new RiakPersistence();
            //riakPersistence.save(pessoa);
            
            Pessoa pessoa1 = riakPersistence.findByKey("12345");
            System.out.println(pessoa1.getNome());
            
            riakPersistence.delete("12345");
            
            Pessoa pessoa2 = riakPersistence.findByKey("12345");
            
            
            
        }

    }
