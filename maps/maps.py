from typing import Union


class MapExercise:
    @staticmethod
    def rating(list_of_movies: list[dict]) -> float:
        ratings = list(
            map(
                lambda movie: float(movie["rating_kinopoisk"]),
                filter(
                    lambda movie: movie["country"].count(",")
                    and movie["rating_kinopoisk"]
                    and float(movie["rating_kinopoisk"]) > 0,
                    list_of_movies,
                ),
            )
        )

        return sum(ratings) / len(ratings)

    @staticmethod
    def chars_count(list_of_movies: list[dict], rating: Union[float, int]) -> int:
        return sum(
            map(
                lambda movie: movie["name"].count("и"),
                filter(
                    lambda movie: movie["rating_kinopoisk"]
                    and float(movie["rating_kinopoisk"]) >= rating,
                    list_of_movies,
                ),
            )
        )
