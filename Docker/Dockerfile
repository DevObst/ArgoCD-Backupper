# We use the official argocd image as a base
FROM argoproj/argocd

# Copy the startup script into the container with owner argocd user
COPY --chown=argocd argocd-backup.sh /app/argocd-backup.sh

# We grant the proper permissions to the script
RUN chmod +x /app/argocd-backup.sh

# ENTRYPOINT argument, which will run the startup script
ENTRYPOINT ["/app/argocd-backup.sh"]