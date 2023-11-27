package web.modelo;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class AtendimentoPedagogia {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotNull
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date data;

	@NotNull
	@Temporal(TemporalType.TIME)
	@DateTimeFormat(pattern = "HH:mm")
	private Date horario_inicial;

	@NotNull
	@Temporal(TemporalType.TIME)
	@DateTimeFormat(pattern = "HH:mm")
	private Date horario_final;

	private boolean dificuldade;

	private boolean ausencia;

	private boolean relation;
	
	private boolean indisciplina;

	private String outros;

	@NotNull
	private String exposicao_motivos;

	@NotNull
	private String encaminhamento;

	@NotNull
	@ManyToOne
	private Aluno aluno;

	@ManyToOne
	@NotNull
	private Profissional profissional;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public Date getHorario_inicial() {
		return horario_inicial;
	}

	public void setHorario_inicial(Date horario_inicial) {
		this.horario_inicial = horario_inicial;
	}

	public Date getHorario_final() {
		return horario_final;
	}

	public void setHorario_final(Date horario_final) {
		this.horario_final = horario_final;
	}

	public Boolean getDificuldade() {
		return dificuldade;
	}

	public void setDificuldade(Boolean dificuldade) {
		this.dificuldade = dificuldade;
	}

	public Boolean getAusencia() {
		return ausencia;
	}

	public void setAusencia(Boolean ausencia) {
		this.ausencia = ausencia;
	}

	public Boolean getRelation() {
		return relation;
	}

	public void setRelation(Boolean relation) {
		this.relation = relation;
	}

	public String getOutros() {
		return outros;
	}

	public void setOutros(String outros) {
		this.outros = outros;
	}

	public Boolean getIndisciplina() {
		return indisciplina;
	}

	public void setIndisciplina(Boolean indisciplina) {
		this.indisciplina = indisciplina;
	}

	public String getExposicao_motivos() {
		return exposicao_motivos;
	}

	public void setExposicao_motivos(String exposicao_motivos) {
		this.exposicao_motivos = exposicao_motivos;
	}

	public String getEncaminhamento() {
		return encaminhamento;
	}

	public void setEncaminhamento(String encaminhamento) {
		this.encaminhamento = encaminhamento;
	}

	public Aluno getAluno() {
		return aluno;
	}

	public void setAluno(Aluno aluno) {
		this.aluno = aluno;
	}

	public Profissional getProfissional() {
		return profissional;
	}

	public void setProfissional(Profissional profissional) {
		this.profissional = profissional;
	}

}