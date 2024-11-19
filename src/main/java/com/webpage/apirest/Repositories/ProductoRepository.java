package com.webpage.apirest.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.webpage.apirest.Entities.Producto;

public interface ProductoRepository extends JpaRepository<Producto, Long>{

}
