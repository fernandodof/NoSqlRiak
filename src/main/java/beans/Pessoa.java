package beans;

import java.util.ArrayList;
import java.util.List;

public class Pessoa {

    private String matricula;
    private String nome;
    private String curso;
    private List<Projeto> projetos = new ArrayList<>();

    public Pessoa() {
        // TODO Auto-generated constructor stub
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCurso() {
        return curso;
    }

    public void setCurso(String curso) {
        this.curso = curso;
    }

    public List<Projeto> getProjetos() {
        return projetos;
    }

    public void setProjetos(List<Projeto> projetos) {
        this.projetos = projetos;
    }
    
    public void addProjeto(Projeto projeto){
        this.projetos.add(projeto);
    }
    
    public void removeProjetoByIndex(int index){
        this.projetos.remove(index);
    }

}
