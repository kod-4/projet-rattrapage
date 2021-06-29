<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210623094312 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE home ADD adress VARCHAR(255) NOT NULL');
        $this->addSql('ALTER TABLE rencontre ADD home_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE rencontre ADD CONSTRAINT FK_460C35ED28CDC89C FOREIGN KEY (home_id) REFERENCES home (id)');
        $this->addSql('CREATE INDEX IDX_460C35ED28CDC89C ON rencontre (home_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE home DROP adress');
        $this->addSql('ALTER TABLE rencontre DROP FOREIGN KEY FK_460C35ED28CDC89C');
        $this->addSql('DROP INDEX IDX_460C35ED28CDC89C ON rencontre');
        $this->addSql('ALTER TABLE rencontre DROP home_id');
    }
}
