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

			<!-- ID -->
			<input type="hidden" name="id" value="${atendimento_pedagogia.id}" required value="${atendimento_pedagogia.id}">

			<!-- NOME -->
			<div class="form-group">
				<label for="data" class="col-form-label obrigatorio">Data</label> <input
				class="form-control"
				autofocus
      type="date"
      id="data"
      name="data"
      required
      pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}"value="${atendimento_pedagogia.data}" />
    <span class="validity"></span>
			</div>
			
			<div class="form-group">
				<label for="horario_inicial" class="col-form-label obrigatorio">Horário inicial</label> <input
					type="time" class="form-control" name="horario_inicial" autofocus
					MAXLENGTH="255" required value="${atendimento_pedagogia.horario_inicial}">
			</div>
			
			<div class="form-group">
				<label for="horario_final" class="col-form-label obrigatorio">Horário final</label> <input
					type="time" class="form-control" name="horario_final" autofocus
					MAXLENGTH="255" required value="${atendimento_pedagogia.horario_final}">
			</div>
			
			<div class="form-group">
				<div class ="form-check form-switch">
					<input class="form-check-input" type="checkbox" id="dificuldade" checked
					name="dificuldade" value="${atendimento_pedagogia.dificuldade}"> <label class="form-check-label"
					for="dificuldade">Possui dificuldade</label>
				</div>
			</div>
			
			<div class="form-group">
				<div class ="form-check form-switch">
					<input class="form-check-input" type="checkbox" id="ausencia" checked
					name="ausencia"value="${atendimento_pedagogia.ausencia}"> <label class="form-check-label"
					for="ausencia">Ausente</label>
				</div>
			</div>
			<div class="form-group">
				<div class ="form-check form-switch">
					<input class="form-check-input" type="checkbox" id="relation" checked
					name="relation"value="${atendimento_pedagogia.relation}"> <label class="form-check-label"
					for="relation">Possui relação</label>
				</div>
			</div>
			
			<div class="form-group">
				<label for="outros" class="col-form-label obrigatorio">Outros</label> <input
					type="text" class="form-control" name="outros" autofocus
					MAXLENGTH="255" required value="${atendimento_pedagogia.outros}">
			</div>
			
		<div class="form-group">
				<div class ="form-check form-switch">
					<input class="form-check-input" type="checkbox" id="indisciplina" checked
					name="indisciplina" value="${atendimento_pedagogia.indisciplina}"> <label class="form-check-label"
					for="indisciplina">Indisciplina</label>
				</div>
			</div>
			
			<div class="form-group">
				<label for="exposicao_motivos" class="col-form-label obrigatorio">Exposição dos Motivos</label> <input
					type="text" class="form-control" name="exposicao_motivos" autofocus
					MAXLENGTH="255" required value="${atendimento_pedagogia.exposicao_motivos}">
			</div>
			<div class="form-group">
				<label for="encaminhamento" class="col-form-label obrigatorio">Encaminhamento</label> <input
					type="text" class="form-control" name="encaminhamento" autofocus
					MAXLENGTH="255" required value="${atendimento_pedagogia.encaminhamento}">
			</div>
			<div class="form-group">
				<label for="idAluno" class="col-form-label obrigatorio">ID do Aluno</label> <input
					type="number" class="form-control" name="idAluno" autofocus
					MAXLENGTH="255" required value="${atendimento_pedagogia.idAluno}">
			</div>
			<div class="form-group">
				<label for="idProfissional" class="col-form-label obrigatorio">ID do Profissional</label> <input
					type="number" class="form-control" name="idProfissional" autofocus
					MAXLENGTH="255" required value="${atendimento_pedagogia.idProfissional}">
			</div>

			<div class="text-center">
				<button type="submit" class="btn btn-primary btn-lg">
					<i class="bi bi-arrow-clockwise"></i> Atualizar
				</button>
				<a href="<c:url value="/atendimento_pedagogia/lista" />"
					class="btn btn-secondary btn-lg"> <i class="bi bi-x"></i>
					Cancelar
				</a>
			</div>

		</form>
	</div>
</main>

<c:import url="../componentes/rodape.jsp" />