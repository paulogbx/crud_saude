package web.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import web.modelo.AtendimentoSaude;

@Repository
public class AtedimentoSaudeDao {

	@PersistenceContext
	private EntityManager manager;

	public void adiciona(AtendimentoSaude atendimento_saude) {
		manager.persist(atendimento_saude);
	}

	public void altera(AtendimentoSaude atendimento_saude) {
		manager.merge(atendimento_saude);
	}

	public List<AtendimentoSaude> lista() {
		return manager.createQuery("select c from AtendimentoPedagogia c order by c.id desc", AtendimentoSaude.class).getResultList();
	}

	public AtendimentoSaude buscaPorId(Long id) {
		return manager.find(AtendimentoSaude.class, id);
	}
	
	public void remove(Long id) {
		manager.createQuery("delete from AtendimentoSaude c where c.id = :id").setParameter("id", id).executeUpdate();
	}

}
