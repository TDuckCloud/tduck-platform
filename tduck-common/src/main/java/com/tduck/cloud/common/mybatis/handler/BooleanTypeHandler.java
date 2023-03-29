
package com.tduck.cloud.common.mybatis.handler;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * 处理布尔转换 mysql能自动转换
 * 有的数据库不支持自动转换 pgsql不行 干脆统一处理了
 *
 * @author tduck
 */
public class BooleanTypeHandler extends BaseTypeHandler<Boolean> {

    public BooleanTypeHandler() {
    }

    @Override
    public void setNonNullParameter(PreparedStatement ps, int i, Boolean parameter, JdbcType jdbcType) throws SQLException {
        ps.setInt(i, parameter ? 1 : 0);
    }

    @Override
    public Boolean getNullableResult(ResultSet rs, String columnName) throws SQLException {
        boolean result = rs.getInt(columnName) != 0;
        return !result && rs.wasNull() ? null : result;
    }

    @Override
    public Boolean getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
        boolean result = rs.getInt(columnIndex) != 0;
        return !result && rs.wasNull() ? null : result;
    }

    @Override
    public Boolean getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
        boolean result = cs.getInt(columnIndex) != 0;
        return !result && cs.wasNull() ? null : result;
    }


}
