<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Cadastrar Profissional</title>

<c:import url="../componentes/cabecalho.jsp" />

<div class="p-5 mb-4 bg-light rounded-3">
	<div class="container py-5">
		<h1 class="display-5 fw-bold">Cadastrar Profissional</h1>
		<p class="col-md-12 fs-4">Preencha o formulário abaixo para
			realizar o cadastro do profissional no sistema.</p>
	</div>
</div>

<main>
	<div class="container">
		<form action="adiciona" method="POST" class="row g-3">

			<security:csrfInput />

			<!-- NOME -->
			<div class="form-group">
				<label for="nome" class="col-form-label obrigatorio">Nome</label> <input
					type="text" class="form-control" name="nome" autofocus
					MAXLENGTH="255" required>
			</div>

			<!-- EMAIL -->
			<div class="form-group">
				<label for="email" class="col-form-label obrigatorio">Email</label>
				<input type="email" class="form-control" name="email"
					MAXLENGTH="255" required>
			</div>

			<!-- Siape -->
			<div class="form-group">
				<label for="siape" class="col-form-label obrigatorio">Siape</label>
				<input type="text" class="form-control" name="siape" MAXLENGTH="12"
					required>
			</div>
			<div class="form-group">
				<label for="setor" class="form-label obrigatorio">Setor</label> <select
					class="form-select" name="setor">
					<option>Saude</option>
					<option>Pedagogia</option>
				</select>
			</div>

			<div class="form-group">
				<div class="form-check form-switch">
					<input class="form-check-input" type="checkbox" id="status" checked
						name="status"> <label class="form-check-label"
						for="status">Ativo</label>
				</div>
			</div>

			<div class="text-center">
				<button type="submit" class="btn btn-primary btn-lg">
					<i class="bi bi-plus-circle"></i> Cadastrar
				</button>
				<button type="reset" class="btn btn-secondary btn-lg">
					<i class="bi bi-trash"></i> Limpar
				</button>
			</div>

		</form>
	</div>
</main>

<c:import url="../componentes/rodape.jsp" />