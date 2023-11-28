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
			<div class="form-group col-md-6">
				<label for="data" class="col-form-label obrigatorio">Data</label> <input
					class="form-control" autofocus type="date" id="data" name="data"
					required value="${atendimento_saude.data}" />  <span
					class="validity"></span>
			</div>

			<div class="form-group col-md-3">
				<label for="horario" class="col-form-label obrigatorio">Horário
				</label> <input type="time" class="form-control" name="horario"
					MAXLENGTH="255" required value="${atendimento_saude.horario}">
			</div>

			<div class="form-group">
				<label for="possui_problema" class="form-label obrigatorio">Possui
					problema?</label> <select class="form-select" name="possui_problema">
					<option>Sim</option>
					<option>Nao</option>
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
				<label for="aluno.id" class="form-label obrigatorio">Aluno</label> <select
					class="form-select" name="aluno.id">

					<c:forEach var="aluno" items="${alunos}">
						<option value="${aluno.id}"
							${aluno.id == atendimento_saude.aluno.id?'selected': '' }>${aluno.matricula}-
							${aluno.nome}</option>
					</c:forEach>
				</select>
			</div>


			<div class="form-group">
				<label for="profissional.id" class="form-label obrigatorio">Profissional</label>
				<select class="form-select" name="profissional.id">

					<c:forEach var="profissional" items="${profissionals}">
						<option value="${profissional.id}"
							${profissional.id  == atendimento_saude.profissional.id?'selected': ''}>${profissional.siape}
							- ${profissional.nome}</option>
					</c:forEach>
				</select>
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