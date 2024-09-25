package com.mycompany.miniproject.type;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DeliveryStatusTypeHandler extends BaseTypeHandler<DeliveryStatus> {

    @Override
    public void setNonNullParameter(PreparedStatement ps, int i, DeliveryStatus parameter, JdbcType jdbcType) throws SQLException {
        ps.setString(i, parameter.getValue()); // Enum의 value를 데이터베이스에 저장
    }

    @Override
    public DeliveryStatus getNullableResult(ResultSet rs, String columnName) throws SQLException {
        String value = rs.getString(columnName);
        return DeliveryStatus.fromValue(value); // 데이터베이스의 값을 Enum으로 변환
    }

    @Override
    public DeliveryStatus getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
        String value = rs.getString(columnIndex);
        return DeliveryStatus.fromValue(value); // 데이터베이스의 값을 Enum으로 변환
    }

    @Override
    public DeliveryStatus getNullableResult(java.sql.CallableStatement cs, int columnIndex) throws SQLException {
        String value = cs.getString(columnIndex);
        return DeliveryStatus.fromValue(value); // 데이터베이스의 값을 Enum으로 변환
    }
}

