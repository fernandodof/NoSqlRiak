/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import beans.Pessoa;
import com.basho.riak.client.IRiakClient;
import com.basho.riak.client.RiakException;
import com.basho.riak.client.RiakFactory;
import com.basho.riak.client.RiakRetryFailedException;
import com.basho.riak.client.bucket.Bucket;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class RiakPersistence {

    private IRiakClient riakClient;

    public IRiakClient getRiakClient() {
        try {
            riakClient = RiakFactory.pbcClient();
        } catch (RiakException ex) {
            Logger.getLogger(RiakPersistence.class.getName()).log(Level.SEVERE, null, ex);
        }
        return riakClient;
    }

    public void save(Pessoa pessoa) {
        try {
            Bucket bucket = this.getRiakClient().fetchBucket("repositorioPessoas").execute();
            bucket.store(pessoa.getMatricula(), pessoa).execute();
        } catch (RiakRetryFailedException ex) {
            Logger.getLogger(RiakPersistence.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            riakClient.shutdown();
        }
    }

    public Pessoa findByKey(String matricula) {
        Pessoa pessoa = null;
        try {
            Bucket clienteBucket = this.getRiakClient().fetchBucket("repositorioPessoas").execute();
            pessoa = clienteBucket.fetch(matricula, Pessoa.class).execute();
        } catch (RiakRetryFailedException ex) {
            Logger.getLogger(RiakPersistence.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            riakClient.shutdown();
        }
        return pessoa;
    }

    public void delete(String matricula) {
        try {
            Bucket clienteBucket = this.getRiakClient().fetchBucket("pessoas").execute();
            clienteBucket.delete(matricula).execute();
            
        } catch (RiakRetryFailedException ex) {
            Logger.getLogger(RiakPersistence.class.getName()).log(Level.SEVERE, null, ex);
        } catch (RiakException ex) {
            Logger.getLogger(RiakPersistence.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            this.riakClient.shutdown();
        }

    }

    public List<Pessoa> getAllPeople() {
        List<Pessoa> pessoas = new ArrayList<>();
        try {
            Bucket clienteBucket = this.getRiakClient().fetchBucket("repositorioPessoas").execute();
            Iterable<String> iterable = clienteBucket.keys();
            for (Iterator it = iterable.iterator(); it.hasNext();) {
                Object key = it.next();
                Pessoa pessoa = clienteBucket.fetch(key.toString(), Pessoa.class).execute();
                pessoas.add(pessoa);
                pessoa = new Pessoa();
            }
        } catch (RiakRetryFailedException ex) {
            Logger.getLogger(RiakPersistence.class.getName()).log(Level.SEVERE, null, ex);
        } catch (RiakException ex) {
            Logger.getLogger(RiakPersistence.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            this.riakClient.shutdown();
        }
        return pessoas;
    }
}
