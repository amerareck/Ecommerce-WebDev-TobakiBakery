package com.mycompany.miniproject.type;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ProductStateTypeHandler extends BaseTypeHandler<ProductState> {

    @Override
    public void setNonNullParameter(PreparedStatement ps, int i, ProductState parameter, JdbcType jdbcType) throws SQLException {
        ps.setString(i, parameter.getValue()); // Enum의 value를 데이터베이스에 저장
    }

    @Override
    public ProductState getNullableResult(ResultSet rs, String columnName) throws SQLException {
        String value = rs.getString(columnName);
        return ProductState.fromValue(value); // 데이터베이스의 값을 Enum으로 변환
    }

    @Override
    public ProductState getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
        String value = rs.getString(columnIndex);
        return ProductState.fromValue(value); // 데이터베이스의 값을 Enum으로 변환
    }

    @Override
    public ProductState getNullableResult(java.sql.CallableStatement cs, int columnIndex) throws SQLException {
        String value = cs.getString(columnIndex);
        return ProductState.fromValue(value); // 데이터베이스의 값을 Enum으로 변환
    }
}

