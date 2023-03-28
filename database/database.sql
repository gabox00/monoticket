CREATE DATABASE gabriel_gutierrez;
use gabriel_gutierrez;

CREATE TABLE movies(
    id                  int(255) auto_increment not null primary key,
    title               varchar(100) not null,
    synopsis            varchar(255) not null,
    cover               varchar(255) not null,
    created_at          datetime default current_timestamp() not null,
    updated_at          datetime default current_timestamp() on update current_timestamp() not null
)ENGINE=InnoDb;

CREATE TABLE reviews(
   id                  int(255) auto_increment not null primary key,
   movie_id            int(255) not null,
   review              TEXT,
   created_at          datetime default current_timestamp() null,
   updated_at          datetime default current_timestamp() null on update current_timestamp(),
   CONSTRAINT fk_movie_comment FOREIGN KEY(movie_id) REFERENCES movies(id)
)ENGINE=InnoDb;

INSERT INTO movies (title, synopsis, cover) VALUES ('El Gran Hotel Budapest', 'La historia del legendario gerente de un hotel europeo y su joven empleado que se convierte en su amigo.', 'https://picsum.photos/200/300');
INSERT INTO movies (title, synopsis, cover) VALUES ('El Padrino', 'La saga de la familia Corleone, contada a través de varias generaciones.', 'https://picsum.photos/200/300');
INSERT INTO movies (title, synopsis, cover) VALUES ('Blade Runner', 'Un blade runner debe perseguir y tratar de retirar a cuatro replicantes que han robado un barco en el espacio y han regresado a la Tierra para encontrar a su creador.', 'https://picsum.photos/200/300');
INSERT INTO movies (title, synopsis, cover) VALUES ('La La Land', 'Un pianista de jazz y una actriz aspirante a actriz se enamoran mientras persiguen sus sueños en Los Ángeles.', 'https://picsum.photos/200/300');
INSERT INTO movies (title, synopsis, cover) VALUES ('Matrix', 'Un hacker es llevado al mundo de la rebelión contra las máquinas, donde aprende la verdad sobre la realidad y su papel en la guerra contra sus agentes.', 'https://picsum.photos/200/300');
INSERT INTO movies (title, synopsis, cover) VALUES ('Forrest Gump', 'La historia de un hombre con discapacidad intelectual que se convierte en un atleta olímpico, un héroe de guerra y un empresario exitoso.', 'https://picsum.photos/200/300');
INSERT INTO movies (title, synopsis, cover) VALUES ('El Club de la Pelea', 'Un hombre aburrido y sin rumbo en su vida comienza un club de lucha clandestino que se convierte en una sensación en todo el país.', 'https://picsum.photos/200/300');
INSERT INTO movies (title, synopsis, cover) VALUES ('The Shawshank Redemption', 'Dos hombres encarcelados establecen una amistad inquebrantable y encuentran la esperanza a través de un acto de redención final.', 'https://picsum.photos/200/300');
INSERT INTO movies (title, synopsis, cover) VALUES ('El Señor de los Anillos', 'La historia de un hobbit y su equipo de compañeros que emprenden una misión épica para destruir un anillo mágico que amenaza con destruir el mundo.', 'https://picsum.photos/200/300');
INSERT INTO movies (title, synopsis, cover) VALUES ('Star Wars: Episodio IV - Una Nueva Esperanza', 'La historia de un joven granjero que se convierte en un héroe intergaláctico en su lucha contra el malvado Imperio Galáctico.', 'https://picsum.photos/200/300');

INSERT INTO reviews (movie_id, review) VALUES (1, 'Excelente película, con una trama muy interesante y un gran reparto de actores.');
INSERT INTO reviews (movie_id, review) VALUES (1, 'La película es muy divertida y el estilo visual es impresionante.');
INSERT INTO reviews (movie_id, review) VALUES (2, 'El Padrino es una obra maestra del cine, con grandes actuaciones y una trama emocionante.');
INSERT INTO reviews (movie_id, review) VALUES (2, 'El Padrino es una película que siempre vale la pena ver de nuevo, con una gran cantidad de detalles que te pierdes la primera vez.');
INSERT INTO reviews (movie_id, review) VALUES (3, 'Blade Runner es una película visionaria, con una trama profunda y compleja y una actuación excelente.');
INSERT INTO reviews (movie_id, review) VALUES (3, 'Blade Runner es una película muy interesante y entretenida, con una historia que te mantiene en tensión todo el tiempo.');
INSERT INTO reviews (movie_id, review) VALUES (4, 'La La Land es una película hermosa, con una gran banda sonora y una actuación espectacular de los protagonistas.');
INSERT INTO reviews (movie_id, review) VALUES (4, 'La La Land es una película que te hace sentir bien, con una historia romántica y emotiva.');
INSERT INTO reviews (movie_id, review) VALUES (5, 'Matrix es una película icónica, con una trama compleja y una actuación excelente de los protagonistas.');
INSERT INTO reviews (movie_id, review) VALUES (5, 'Matrix es una película muy entretenida y emocionante, con una trama que te mantiene en tensión todo el tiempo.');
INSERT INTO reviews (movie_id, review) VALUES (6, 'Forrest Gump es una película conmovedora, con una actuación excelente de Tom Hanks y una historia emocionante.');
INSERT INTO reviews (movie_id, review) VALUES (6, 'Forrest Gump es una película que te hace sentir bien, con una historia conmovedora y un gran reparto de actores.');
INSERT INTO reviews (movie_id, review) VALUES (7, 'El Club de la Pelea es una película interesante y muy bien hecha, con una trama sorprendente y un gran reparto de actores.');
INSERT INTO reviews (movie_id, review) VALUES (7, 'El Club de la Pelea es una película muy entretenida, con una trama interesante y un gran final.');
INSERT INTO reviews (movie_id, review) VALUES (8, 'The Shawshank Redemption es una película conmovedora, con una gran actuación de los protagonistas y una historia emocionante.');
INSERT INTO reviews (movie_id, review) VALUES (8, 'The Shawshank Redemption es una película que te hace sentir bien, con una historia conmovedora y un gran reparto de actores.');
INSERT INTO reviews (movie_id, review) VALUES (9, 'El Señor de los Anillos es una película épica, con una trama emocionante y una gran cantidad de detalles que la hacen muy interesante.');
INSERT INTO reviews (movie_id, review) VALUES (9, 'El Señor de los Anillos es una película que siempre vale la pena ver de nuevo, con una trama emocionante y un gran reparto de actores.');
INSERT INTO reviews (movie_id, review) VALUES (10, 'Una película clásica de ciencia ficción que inició una franquicia legendaria.');
INSERT INTO reviews (movie_id, review) VALUES (10, 'La música es icónica, y la actuación de Harrison Ford es impresionante.');