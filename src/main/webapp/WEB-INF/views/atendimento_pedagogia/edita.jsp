<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Editar Atendimento Pedagogico</title>

<c:import url="../componentes/cabecalho.jsp" />

<div class="p-5 mb-4 bg-light rounded-3">
	<div class="container py-5">
		<h1 class="display-5 fw-bold">Editar Atendimento Pedagogico</h1>
		<p class="col-md-12 fs-4">Preencha o formulário abaixo para
			realizar a alteração do atendimento pedagogico no sistema.</p>
	</div>
</div>

<main>
	<div class="container">
		<form action="altera" method="POST" class="row g-3">

			<security:csrfInput />

			<input type="hidden" name="id" value="${atendimento_pedagogia.id}">

			<div class="form-group col-md-6">
				<label for="data" class="col-form-label obrigatorio">Data</label> <input
					class="form-control" autofocus type="date" id="data" name="data"
					required value="${atendimento_pedagogia.data }" />
			</div>

			<div class="form-group col-md-3">
				<label for="horario_inicial" class="col-form-label obrigatorio">Horário
					inicial</label> <input type="time" class="form-control"
					name="horario_inicial" MAXLENGTH="255" required
					value="${atendimento_pedagogia.horario_inicial }">
			</div>

			<div class="form-group col-md-3">
				<label for="horario_final" class="col-form-label obrigatorio">Horário
					final</label> <input type="time" class="form-control" name="horario_final"
					MAXLENGTH="255" required
					value="${atendimento_pedagogia.horario_final }">
			</div>

			<label class="obrigatorio">Selecione algum motivo do
				atendimento</label>
			<div class="form-group">
				<div class="form-check form-switch">
					<input class="form-check-input" type="checkbox" id="indisciplina"
						name="indisciplina"
						${atendimento_pedagogia.indisciplina ?'checked': ''  }> <label
						class="form-check-label" for="indisciplina"> Indisciplina
						do aluno</label>
				</div>
			</div>

			<div class="form-group">
				<div class="form-check form-switch">
					<input class="form-check-input" type="checkbox" id="dificuldade"
						name="dificuldade" ${atendimento_pedagogia.dificuldade ?'checked': ''  }> <label class="form-check-label"
						for="dificuldade">Possui dificuldade de ensino e/ou
						aprendizagem</label>
				</div>
			</div>

			<div class="form-group">
				<div class="form-check form-switch">
					<input class="form-check-input" type="checkbox" id="ausencia"
						name="ausencia" ${atendimento_pedagogia.ausencia ?'checked': ''  }> <label class="form-check-label"
						for="ausencia">Ausência do professor</label>
				</div>
			</div>
			<div class="form-group">
				<div class="form-check form-switch">
					<input class="form-check-input" type="checkbox" id="relation"
						name="relation" ${atendimento_pedagogia.relation ?'checked': ''  } > <label class="form-check-label"
						for="relation">Relação professor/aluno</label>
				</div>
			</div>

			<div class="form-group">
				<div class="form-check form-switch">
					<input class="form-check-input" type="checkbox" id="outro"
						name="outro" ${atendimento_pedagogia.outros != null ?'checked': ''  }> <label class="form-check-label" for="outro">Outro</label>
				</div>
			</div>

			<div class="form-group" style="display: none" id="especifique">
				<label for="outros" class="col-form-label">Especifique</label> <input
					type="text" class="form-control" name="outros" autofocus
					MAXLENGTH="255" value="${atendimento_pedagogia.outros }" >
			</div>

			<div class="form-group">
				<label for="exposicao_motivos" class="col-form-label obrigatorio">Exposição
					dos Motivos</label> <input type="text" class="form-control"
					name="exposicao_motivos" MAXLENGTH="255" required
					value="${atendimento_pedagogia.exposicao_motivos}">
			</div>
			<div class="form-group">
				<label for="encaminhamento" class="col-form-label obrigatorio">Encaminhamento</label>
				<input type="text" class="form-control" name="encaminhamento"
					MAXLENGTH="255" required
					value="${atendimento_pedagogia.encaminhamento }">
			</div>

			<div class="form-group">
				<label for="aluno.id" class="form-label obrigatorio">Aluno</label> <select
					class="form-select" name="aluno.id">

					<c:forEach var="aluno" items="${alunos}">
						<option value="${aluno.id}"
							${aluno.id == atendimento_pedagogia.aluno.id?'selected': '' }>${aluno.matricula}-
							${aluno.nome}</option>
					</c:forEach>
				</select>
			</div>


			<div class="form-group">
				<label for="profissional.id" class="form-label obrigatorio">Profissional</label>
				<select class="form-select" name="profissional.id">

					<c:forEach var="profissional" items="${profissionals}">
						<option value="${profissional.id}" ${profissional.id  == atendimento_pedagogia.profissional.id?'selected': ''} >${profissional.siape}
							- ${profissional.nome}</option>
					</c:forEach>
				</select>
			</div>
			
			<div class="text-center">
				<button type="submit" class="btn btn-primary btn-lg">
					<i class="bi bi-arrow-clockwise"></i> Atualizar
				</button>
				<a href="<c:url value="/aluno/lista" />"
					class="btn btn-secondary btn-lg"> <i class="bi bi-x"></i>
					Cancelar
				</a>
			</div>

		</form>
	</div>
</main>

<script>

if(document.getElementById("outro").checked){
	document.getElementById("especifique").style.display = "block";
}
	$(document).ready(function() {
		// Quando o estado do checkbox é alterado
		$('#outro').change(function() {
			// Se o checkbox está marcado, mostra o campo de entrada
			if (this.checked) {
				$('#especifique').show();
			} else {
				// Se não, esconde o campo de entrada
				$('#especifique').hide();
			}
		});
	});
</script>

<c:import url="../componentes/rodape.jsp" />