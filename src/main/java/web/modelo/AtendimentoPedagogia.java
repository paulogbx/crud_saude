package web.modelo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Date data;

	@NotNull
	@Temporal(TemporalType.TIME)
	@DateTimeFormat(pattern = "HH:mm")
	private Date horario_inicial;

	@NotNull
	@Temporal(TemporalType.TIME)
	@DateTimeFormat(pattern = "HH:mm")
	private Date horario_final;
	
	@NotNull
	private Boolean dificuldade;
	
	@NotNull
	private Boolean ausencia;
	
	@NotNull
	private Boolean relation;
	
	@NotNull
	private String outros;
	
	@NotNull
	private Boolean indisciplina;

	@NotNull
	private String exposicao_motivos;

	@NotNull
	private String encaminhamento;
	@NotNull
	private Long idAluno;
	@NotNull
	private Long idProfissional;
	
	private Boolean status;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getData() {
		return data;
	}

	public void setData(String dateString) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date parsedDate = null;
		try {
			parsedDate = dateFormat.parse(dateString);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		this.data = parsedDate;
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

	public @NotNull Boolean getIndisciplina() {
		return indisciplina;
	}

	public void setIndisciplina(@NotNull Boolean indisciplina) {
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

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
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

	public String getOutros() {
		return outros;
	}

	public void setOutros(String outros) {
		this.outros = outros;
	}

	public Boolean getRelation() {
		return relation;
	}

	public void setRelation(Boolean relation) {
		this.relation = relation;
	}

	public Long getIdAluno() {
		return idAluno;
	}

	public void setIdAluno(Long idAluno) {
		this.idAluno = idAluno;
	}

	public Long getIdProfissional() {
		return idProfissional;
	}

	public void setIdProfissional(Long idProfissional) {
		this.idProfissional = idProfissional;
	}

}