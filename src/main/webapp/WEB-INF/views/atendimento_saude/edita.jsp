<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Editar Atendimento de Saude</title>

<c:import url="../componentes/cabecalho.jsp" />

<div class="p-5 mb-4 bg-light rounded-3">
	<div class="container py-5">
		<h1 class="display-5 fw-bold">Editar Atendimento de saude</h1>
		<p class="col-md-12 fs-4">Preencha o formulário abaixo para
			realizar a alteração do atendimento de saude no sistema.</p>
	</div>
</div>

<main>
	<div class="container">
		<form action="altera" method="POST" class="row g-3">

			<security:csrfInput />

			<!-- ID -->
			<input type="hidden" name="id" value="${atendimento_saude.id}"
				required value="${atendimento_saude.id}">

			<!-- NOME -->
			<div class="form-group">
				<label for="data" class="col-form-label obrigatorio">Data</label> <input
					class="form-control" autofocus type="date" id="data" name="data"
					required pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}"
					value="${atendimento_saude.data}" /> <span class="validity"></span>
			</div>

			<div class="form-group">
				<label for="horario" class="col-form-label obrigatorio">Horário</label>
				<input type="time" class="form-control" name="horario" autofocus
					MAXLENGTH="255" required>
			</div>

			<div class="form-group">
				<label for="possui_problema" class="form-label obrigatorio">Possui
					problema?</label> <select class="form-select" name="possui_problema">
					<option>Sim</option>
					<option>Não</option>
				</select>
			</div>

			<div class="form-group">
				<label for="esse_problema_dificulta_o_aprendizado"
					class="form-label obrigatorio">Esse problema dificulta o
					aprendizado? </label> <select class="form-select"
					name="esse_problema_dificulta_o_aprendizado">
					<option>Sim</option>
					<option>Não</option>
				</select>
			</div>

			<div class="form-group">
				<label for="idAluno" class="col-form-label obrigatorio">Matrícula
					do Aluno</label> <input type="number" class="form-control" name="idAluno"
					autofocus MAXLENGTH="255" required>
			</div>
			<div class="form-group">
				<label for="idProfissional" class="col-form-label obrigatorio">Siape
					do Profissional</label> <input type="number" class="form-control"
					name="idProfissional" autofocus MAXLENGTH="255" required>
			</div>
			<div class="text-center">
				<button type="submit" class="btn btn-primary btn-lg">
					<i class="bi bi-arrow-clockwise"></i> Atualizar
				</button>
				<a href="<c:url value="/atendimento_saude/lista" />"
					class="btn btn-secondary btn-lg"> <i class="bi bi-x"></i>
					Cancelar
				</a>
			</div>

		</form>
	</div>
</main>

<c:import url="../componentes/rodape.jsp" />