from flask import Flask, abort, request
from http import HTTPStatus


class FlaskExercise:
    users: dict = {}

    @staticmethod
    def configure_routes(app: Flask) -> None:
        @app.post("/user")
        def user_post() -> tuple:
            name = request.json.get("name")
            if name is None:
                return {
                    "errors": {"name": "This field is required"}
                }, HTTPStatus.UNPROCESSABLE_ENTITY

            FlaskExercise.users[name] = {}
            return {"data": f"User {name} is created!"}, HTTPStatus.CREATED

        @app.get("/user/<string:name>")
        def show_user(name: str) -> dict:
            FlaskExercise.abort_if_user_not_found(name)
            return {"data": f"My name is {name}"}

        @app.patch("/user/<string:name>")
        def update_user(name: str) -> dict:
            FlaskExercise.abort_if_user_not_found(name)
            new_name = request.json.get("name")
            user = FlaskExercise.users.pop(name)
            FlaskExercise.users[new_name] = user
            return {"data": f"My name is {new_name}"}

        @app.delete("/user/<string:name>")
        def delete_user(name: str) -> tuple:
            FlaskExercise.abort_if_user_not_found(name)
            FlaskExercise.users.pop(name)
            return "", HTTPStatus.NO_CONTENT

    @staticmethod
    def abort_if_user_not_found(name: str) -> None:
        name = FlaskExercise.users.get(name)
        if name is None:
            abort(HTTPStatus.NOT_FOUND)
