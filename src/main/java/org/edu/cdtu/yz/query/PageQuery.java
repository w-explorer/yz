package org.edu.cdtu.yz.query;

import lombok.Data;

/**
 * @author wencheng
 * @since 2019-06-25
 */
@Data
public class PageQuery {
    private Integer page;
    private Integer rows;

    public Integer getStart () {
        return (page - 1 ) * rows;
    }
}