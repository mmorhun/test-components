# Image format: quay.io/org/namespace/component-name
FROM quay.io/mmorhun-org/test/component1-nudging:tag@sha256:24a3714e0e76328d0a2ddfe4b178079e5a334800ab19a1c0fda4ba03112a1974 AS source

FROM python:3.9-slim AS runner
WORKDIR /app
COPY --from=source /app/app.py .
EXPOSE 8080
CMD ["python", "app.py"]
