package web.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import web.modelo.Aluno;

@Repository
public class AlunoDao {

	@PersistenceContext
	private EntityManager manager;

	public void adiciona(Aluno aluno) {
		manager.persist(aluno);
	}

	public void altera(Aluno aluno) {
		manager.merge(aluno);
	}

	public List<Aluno> lista() {
		return manager.createQuery("select c from Aluno c order by c.id desc", Aluno.class).getResultList();
	}

	public Aluno buscaPorId(Long id) {
		return manager.find(Aluno.class, id);
	}

	public List<Aluno> buscaPorMatricula(String matricula) {
		return manager.createQuery("select a from Aluno a where a.matricula = :matricula", Aluno.class).setParameter("matricula", matricula)
				.getResultList();
	}
	
	public void remove(Long id) {
		manager.createQuery("delete from Aluno c where c.id = :id").setParameter("id", id).executeUpdate();
	}

}
