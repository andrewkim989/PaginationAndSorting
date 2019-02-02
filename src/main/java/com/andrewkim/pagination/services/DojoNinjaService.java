package com.andrewkim.pagination.services;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.andrewkim.pagination.models.Dojo;
import com.andrewkim.pagination.models.Ninja;
import com.andrewkim.pagination.repositories.DojoRepository;
import com.andrewkim.pagination.repositories.NinjaRepository;

@Service
@Transactional
public class DojoNinjaService {
	@Autowired
	private final DojoRepository dojoRepository;
	
	@Autowired 
	private final NinjaRepository ninjaRepository;
	
	private static final int PAGE_SIZE = 8;
	
	public DojoNinjaService (DojoRepository dojoRepository, NinjaRepository ninjaRepository) {
		this.dojoRepository = dojoRepository;
		this.ninjaRepository = ninjaRepository;
	}
	
	public List<Dojo> allDojos() {
		return dojoRepository.findAll();
	}
	
    public Page<Ninja> ninjasPerPage(int pageNumber) {
        PageRequest pageRequest = PageRequest.of(pageNumber, PAGE_SIZE, Sort.Direction.ASC, "firstName");
        return ninjaRepository.findAll(pageRequest);
    }
    
    public Page<Object[]> sortedDojos(int number) {
    	PageRequest request = PageRequest.of(number, PAGE_SIZE, Sort.Direction.ASC, "name");
        return dojoRepository.joinDojosAndNinjas2(request);
    }
	
	public List<Object[]> dojoNinjas() {
		return dojoRepository.joinDojosAndNinjas();
	}
}
