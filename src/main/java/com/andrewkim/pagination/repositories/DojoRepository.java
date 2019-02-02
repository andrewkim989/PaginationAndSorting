package com.andrewkim.pagination.repositories;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.andrewkim.pagination.models.Dojo;

@Repository
public interface DojoRepository extends PagingAndSortingRepository<Dojo, Long> {
	List<Dojo> findAll();
	
	@Query("SELECT d, n FROM Dojo d JOIN d.ninjas n")
    List<Object[]> joinDojosAndNinjas();
    
    @Query("SELECT d, n FROM Dojo d JOIN d.ninjas n")
    Page<Object[]> joinDojosAndNinjas2(PageRequest request);
}
