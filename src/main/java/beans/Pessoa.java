package beans;


import java.util.ArrayList;
import java.util.List;

public class Pessoa {
	private String cpf;
	private String nome;
	private List<Projeto> projetos = new ArrayList<>();
	
	public Pessoa() {
		// TODO Auto-generated constructor stub
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
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

}
