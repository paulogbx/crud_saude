<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Exibe os dados dos atendimentos pedagogicos</title>
<c:import url="../componentes/cabecalho.jsp" />

<main>
	<div class="container">
		<div class="card border-light mb-3">
			<div class="card-header">Exibe os dados dos atendimentos pedagogicos</div>
			<!-- Table -->
			<div class="card-body">
				<div class="table-responsive">
					<table
						class="table table-striped table-bordered dt-responsive nowrap">
						<tr>
							<th width="30%">ID</th>
							<td>${atendimento_pedagogia.id}</td>
						</tr>
						<tr>
							<th>Aluno</th>
							<td style="font-weight: bold; color: blue;">${atendimento_pedagogia.aluno.nome}</td>
						</tr>
						<tr>
							<th>Profissional</th>
							<td style="font-weight: bold; color: blue;">${atendimento_pedagogia.profissional.nome}</td>
						</tr>
						<tr>
							<th>Data</th>
							<td>${atendimento_pedagogia.data}</td>
						</tr>
						<tr>
							<th>Horario inicial</th>
							<td>${atendimento_pedagogia.horario_inicial}</td>
						</tr>
						<tr>
							<th>Horario final</th>
							<td>${atendimento_pedagogia.horario_final}</td>
						</tr>
						<tr>
							<th>Dificuldade</th>
							<td>${atendimento_pedagogia.dificuldade ? 'Sim' : 'Não'}</td>
						</tr>
						<tr>
							<th>Ausência</th>
							<td>${atendimento_pedagogia.ausencia ? 'Sim' : 'Não'}</td>
						</tr>
						<tr>
							<th>Relação</th>
							<td>${atendimento_pedagogia.relation ? 'Sim' : 'Não'}</td>
						</tr>
						<tr>
							<th>Outros</th>
							<td>${atendimento_pedagogia.outros}</td>
						</tr>
						
						<tr>
							<th>Indisciplina</th>
							<td>${atendimento_pedagogia.indisciplina ? 'Sim' : 'Não'}</td>
						</tr>
						<tr>
							<th>Motivo</th>
							<td>${atendimento_pedagogia.exposicao_motivos}</td>
						</tr>
						<tr>
							<th>Encaminhamento</th>
							<td>${atendimento_pedagogia.encaminhamento}</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div align="center">
			<!-- Cadastrar -->
			<a href="<c:url value="/atendimento_pedagogia/novo" />"
				class="btn btn-primary btn-lg"><i class="bi bi-plus-circle"></i>
				Cadastrar</a>
			<!-- Editar -->
			<a href="<c:url value="/atendimento_pedagogia/edita?id=${atendimento_pedagogia.id}" />"
				class="btn btn-warning btn-lg"><i class="bi bi-pencil-square"></i>
				Editar </a>
			<!-- Excluir -->
			<button type="button" class="btn btn-danger btn-lg"
				data-bs-toggle="modal" data-bs-target="#modal${atendimento_pedagogia.id}">
				<i class="bi bi-trash"></i> Excluir
			</button>
		</div>
		<!-- Modal -->
		<div class="modal fade" id="modal${atendimento_pedagogia.id}" tabindex="-1">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Exclusão do atendimento pedagogico</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-la bel="Close">
							<span aria-hidden="true"></span>
						</button>
					</div>
					<div class="modal-body">
						<p>
							Deseja realmente excluir o atendimento <br>ID (${atendimento_pedagogia.id})
							?
						</p>
					</div>
					<div class="modal-footer">
						<a
							href="<c:url value="/atendimento_pedagogia/remove?id=${atendimento_pedagogia.id}" />"
							class="btn btn-danger"> <i class="bi bi-trash"></i> Excluir
						</a>
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">
							<i class="bi bi-x"></i> Fechar
						</button>
					</div>
				</div>
			</div>
		</div>
		<button class="btn btn-success" onclick="window.history.back()">
			<i class="bi bi-chevron-left"></i> Voltar
		</button>
	</div>
</main>
<c:import url="../componentes/rodape.jsp" />