package io.mosip.pms.ida;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.autoconfigure.jdbc.DataSourceTransactionManagerAutoConfiguration;
import org.springframework.boot.autoconfigure.orm.jpa.HibernateJpaAutoConfiguration;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Import;

import io.mosip.pms.ida.service.PMSDataMigrationService;
import io.mosip.pms.ida.util.RestUtil;
import io.mosip.pms.ida.websub.WebSubPublisher;

@SpringBootApplication
@Import(value = {WebSubPublisher.class,RestUtil.class})
@ComponentScan(basePackages = {"io.mosip.*", "io.mosip.kernel.auth.defaultadapter"})
@EnableAutoConfiguration(exclude = { DataSourceAutoConfiguration.class,
		DataSourceTransactionManagerAutoConfiguration.class, HibernateJpaAutoConfiguration.class })
public class Application implements CommandLineRunner {

	@Autowired
	PMSDataMigrationService pmsIdaDataMigrationService;

	Logger logger = org.slf4j.LoggerFactory.getLogger(Application.class);

	public static void main(String[] args) {
		ConfigurableApplicationContext run = SpringApplication.run(Application.class, args);
		System.exit(SpringApplication.exit(run));
	}

	@Override
	public void run(String... args) throws Exception {
		pmsIdaDataMigrationService.initialize();

	}
}
