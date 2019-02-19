package kr.hs.emirm.config;

import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

import org.springframework.core.io.Resource;
import javax.sql.DataSource;

@Slf4j
@Configuration
@EnableAutoConfiguration
@MapperScan(
    basePackages = {"kr.hs.emirim.**.dao.main"}
)
public class DataConfig {

    @Bean
    public SqlSessionFactory sqlSessionFactory (
            @Qualifier("dataSource") DataSource dataSource
    )throws Exception{
        SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
        sessionFactory.setDataSource(dataSource);

        Resource[] res = new PathMatchingResourcePatternResolver().getResources("classpath:mappers/*.xml");
        sessionFactory.setMapperLocations(res);

        return sessionFactory.getObject();
    }

}
