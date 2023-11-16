package web.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import web.modelo.Profissional;

@Repository
public class ProfissionalDao {

	@PersistenceContext
	private EntityManager manager;

	public void adiciona(Profissional Profissional) {
		manager.persist(Profissional);
	}

	public void altera(Profissional Profissional) {
		manager.merge(Profissional);
	}

	public List<Profissional> lista() {
		return manager.createQuery("select c from Profissional c order by c.id desc", Profissional.class).getResultList();
	}

	public Profissional buscaPorId(Long id) {
		return manager.find(Profissional.class, id);
	}

	public List<Profissional> buscaPorSiape(String siape) {
		return manager.createQuery("select a from Profissional a where a.siape = :siape", Profissional.class)
				.setParameter("siape", siape).getResultList();
	}

	public void remove(Long id) {
		manager.createQuery("delete from Profissional c where c.id = :id").setParameter("id", id).executeUpdate();
	}

}
