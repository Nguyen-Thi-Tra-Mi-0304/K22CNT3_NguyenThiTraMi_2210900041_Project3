package com.bookshopweb.dao;

import java.util.List;
import java.util.Optional;

public interface DAO<T> {
    // thêm dữ liệu
    long insert(T t);

    // cập nhật dữ liệu
    void update(T t);

    // xóa dữ liệu
    void delete(long id);

    // lấy một dữ liệu theo id
    Optional<T> getById(long id);

    // lấy danh sách dữ liệu
    List<T> getAll();

    // lấy một phần danh sách
    List<T> getPart(int limit, int offset);

    // lấy danh sách có phân trang
    List<T> getOrderedPart(int limit, int offset, String orderBy, String orderDir);
}
