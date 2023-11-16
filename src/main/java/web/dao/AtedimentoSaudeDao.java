package web.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import web.modelo.AtendimentoPedagogia;

@Repository
public class AtedimentoSaudeDao {

	@PersistenceContext
	private EntityManager manager;

	public void adiciona(AtendimentoPedagogia atendimento_pedagogia) {
		manager.persist(atendimento_pedagogia);
	}

	public void altera(AtendimentoPedagogia atendimento_pedagogia) {
		manager.merge(atendimento_pedagogia);
	}

	public List<AtendimentoPedagogia> lista() {
		return manager.createQuery("select c from AtendimentoPedagogia c order by c.id desc", AtendimentoPedagogia.class).getResultList();
	}

	public AtendimentoPedagogia buscaPorId(Long id) {
		return manager.find(AtendimentoPedagogia.class, id);
	}
	
	public void remove(Long id) {
		manager.createQuery("delete from AtendimentoPedagogia c where c.id = :id").setParameter("id", id).executeUpdate();
	}

}
