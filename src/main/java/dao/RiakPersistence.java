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
            Bucket bucket = this.getRiakClient().fetchBucket("pessoas").execute();
            bucket.store(pessoa.getCpf(), pessoa).execute();
        } catch (RiakRetryFailedException ex) {
            Logger.getLogger(RiakPersistence.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            riakClient.shutdown();
        }
    }

    public Pessoa findByKey(String cpf) {
        Pessoa pessoa = null;
        try {
            Bucket clienteBucket = this.getRiakClient().fetchBucket("pessoas").execute();
            pessoa = clienteBucket.fetch(cpf, Pessoa.class).execute();
        } catch (RiakRetryFailedException ex) {
            Logger.getLogger(RiakPersistence.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            riakClient.shutdown();
        }
        return pessoa;
    }

    public void delete(String cpf) {
        try {
            Bucket clienteBucket = this.getRiakClient().fetchBucket("pessoas").execute();
            clienteBucket.delete(cpf).execute();

        } catch (RiakRetryFailedException ex) {
            Logger.getLogger(RiakPersistence.class.getName()).log(Level.SEVERE, null, ex);
        } catch (RiakException ex) {
            Logger.getLogger(RiakPersistence.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            this.riakClient.shutdown();
        }
        
    }
}   
