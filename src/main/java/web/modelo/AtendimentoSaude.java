package web.modelo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
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
public class AtendimentoSaude {

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
	private Date horario;

	@NotNull
	private String possui_problema;

	@NotNull
	private String esse_problema_dificulta_o_aprendizado;
	
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

	public Date getHorario() {
		return horario;
	}

	public void setHorario(Date horario) {
		this.horario = horario;
	}

	public String getPossui_problema() {
		return possui_problema;
	}

	public void setPossui_problema(String possui_problema) {
		this.possui_problema = possui_problema;
	}

	public String getEsse_problema_dificulta_o_aprendizado() {
		return esse_problema_dificulta_o_aprendizado;
	}

	public void setEsse_problema_dificulta_o_aprendizado(String esse_problema_dificulta_o_aprendizado) {
		this.esse_problema_dificulta_o_aprendizado = esse_problema_dificulta_o_aprendizado;
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