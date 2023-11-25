<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Listagem de Atendimentos Pedagogicos</title>

<c:import url="../componentes/cabecalho.jsp" />
<main>
	<div class="container">

		<div class="card border-light mb-3">
			<div class="card-header">Listagem de Atendimentos Pedagogicos</div>

			<!-- Table -->
			<div class="card-body">
				<table class="table datatable" id="datatable">
					<thead>
						<tr>
							<th scope="col">ID</th>
							<th scope="col">Aluno</th>
							<th scope="col">Profissional</th>
							<th scope="col">Data</th>
							<th scope="col">Horário Inicial</th>
							<th scope="col">Horário Final</th>
							<th scope="col">Dificuldade</th>
							<th scope="col">Ausência</th>
							<th scope="col">Relação</th>
							<th scope="col">Outros</th>
							<th scope="col">Indisciplina</th>
							<th scope="col">Motivos</th>
							<th scope="col">Encaminhamento</th>
							<th scope="col">Ações</th>
						</tr>
					</thead>
					<tbody>
						<!-- percorre profissionals montando as linhas da tabela -->
						<c:forEach var="atendimento_pedagogia"
							items="${atendimento_pedagogias}">
							<tr>
								<td scope="row">${atendimento_pedagogia.id}</td>
								<td>${atendimento_pedagogia.idAluno}</td>
								<td>${atendimento_pedagogia.idProfissional}</td>
								<td>${atendimento_pedagogia.data}</td>
								<td>${atendimento_pedagogia.horario_inicial}</td>
								<td>${atendimento_pedagogia.horario_final}</td>
								<td>${atendimento_pedagogia.dificuldade ? 'Sim' : 'Não'}</td>
								<td>${atendimento_pedagogia.ausencia ? 'Sim' : 'Não'}</td>
								<td>${atendimento_pedagogia.relation ? 'Sim' : 'Não'}</td>
								<td>${atendimento_pedagogia.outros}</td>
								<td>${atendimento_pedagogia.indisciplina ? 'Sim' : 'Não'}</td>
								<td>${atendimento_pedagogia.exposicao_motivos}</td>
								<td>${atendimento_pedagogia.encaminhamento}</td>
								<td>
									<!-- Exibir --> <a
									href="<c:url value="/atendimento_pedagogia/exibe?id=${atendimento_pedagogia.id}"/>"
									class="btn btn-info btn-sm" data-toggle="tooltip"
									data-bs-placement="bottom" title="Exibir"> <i
										class="bi bi-eye"></i>
								</a> <!-- Editar --> <a
									href="<c:url value="/atendimento_pedagogia/edita?id=${atendimento_pedagogia.id}" />"
									class="btn btn-warning btn-sm" data-toggle="tooltip"
									data-bs-placement="bottom" title="Editar"> <i
										class="bi bi-pencil-square"></i>
								</a> <!-- Excluir -->
									<button type="button" class="btn btn-danger btn-sm"
										data-toggle="tooltip" data-bs-placement="bottom"
										title="Excluir" data-bs-toggle="modal"
										data-bs-target="#modal${atendimento_pedagogia.id}">
										<i class="bi bi-trash"></i>
									</button>
									<div class="modal fade" id="modal${atendimento_pedagogia.id}"
										tabindex="-1">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title">Exclusão do atendimento
														pedagogico</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close">
														<span aria-hidden="true"></span>
													</button>
												</div>
												<div class="modal-body">
													<p>
														Deseja realmente excluir o atendimento pedagogico <br>ID
														(${atendimento_pedagogia.id})?
													</p>
												</div>
												<div class="modal-footer">
													<a
														href="<c:url value="/atendimento_pedagogia/remove?id=${atendimento_pedagogia.id}" />"
														class="btn btn-danger"> <i class="bi bi-trash"></i>
														Excluir
													</a>
													<button type="button" class="btn btn-secondary"
														data-bs-dismiss="modal">
														<i class="bi bi-x"></i> Fechar
													</button>
												</div>
											</div>
										</div>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

		<div align="center">
			<a href="<c:url value="/atendimento_pedagogia/novo" />"
				class="btn btn-primary btn-lg"> <i class="bi bi-plus-circle"></i>
				Cadastrar
			</a>
		</div>
	</div>
</main>
<c:import url="../componentes/rodape.jsp" />